library(syuzhet)
library(readxl)
library(tokenizers)
library(readr)
library(dplyr)
library(writexl)
#install.packages('tokenizers')

# df
df = read_excel("public_sentiment_bert.xlsx")

my_text = df['bert_text']


# Tokenize sentences for each row
my_text$sentences <- lapply(my_text$bert_text, function(x) get_tokens(x)) # or tokenize_sentences


# using custom sentiment lexicons
custom_lexicon = read_delim("Estonian-NRC-EmoLex.txt", 
                            delim = "\t", escape_double = FALSE, 
                            trim_ws = TRUE)

vars = c('Estonian Word', 'English Word', 'negative', 'positive')
lexicon = custom_lexicon[vars]

#lexicon$neg_pos_both_1 = ifelse(lexicon$negative == 1 & lexicon$positive == 1, "both are 1", "not both 1")

lexicon$negative = replace(lexicon$negative, lexicon$negative == 1, -1)

# create value column
lexicon$value = ifelse(lexicon$negative == -1 & lexicon$positive == 0, -1,
                        ifelse(lexicon$negative == 0 & lexicon$positive == 1, 1,
                               ifelse(lexicon$negative == 0 & lexicon$positive == 0, 0,
                                      ifelse(lexicon$negative == -1 & lexicon$positive == 1, 0, NA))))


lexicon = lexicon %>% rename('word' = 'Estonian Word')
lexicon = lexicon %>% relocate(value, .after = word)

lexicon_test = lexicon %>% 
  filter(value != 0)


# sentiment
sentiment_syuzhet = get_sentiment(my_text$sentences, lexicon = lexicon_test[1:2])

head(sentiment_syuzhet)
range(sentiment_syuzhet)
summary(sentiment_syuzhet)


# sentiment to df
df['sentiment'] = sentiment_syuzhet

unique(df['sentiment'])


get_sentiment_label = function(score) {
  if (score > 0) {
    return('LABEL_2') # positive
  } else if (score == 0) {
    return('LABEL_1') # neutral
  } else if (score < 0) {
    return('LABEL_0') # negative
  }
}

df = df %>% 
  mutate(sentiment_label = sapply(sentiment, get_sentiment_label))

table(df$sentiment_label)

#df = df %>% rename('sentiment_syuzhet' = 'sentiment_label')

# save df
write_xlsx(df, 'public_sentiment_bert_syuzhet.xlsx')



# plot
plot = df %>% arrange(created_at) 
simple_plot(plot$sentiment)


# https://programminghistorian.org/en/lessons/sentiment-analysis-syuzhet
# https://cran.r-project.org/web/packages/syuzhet/vignettes/syuzhet-vignette.html