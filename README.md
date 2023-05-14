# Understanding Public and Leaders’ Opinion about Russo-Ukrainian War through Social Media Platforms: An Estonian Case Study

A repository containing the notebooks for the Data Science MSc thesis "Understanding Public and Leaders’ Opinion about Russo-Ukrainian War through Social Media Platforms: An Estonian Case Study".

![Lehes_Visual_Abstract_eng](https://github.com/LisannaL/Thesis_MSc/assets/91329321/efa3efbe-c746-494c-bcc7-5153fd044d32)

# Abstract

With its fast-paced communication, social media is a valuable data source for studying how people express their opinions and views. Focusing on the Estonian context, this study aimed to analyze the Public and Leaders’ (politicians) opinions regarding the Russo-Ukrainian war through social media platforms. 
Two datasets were collected: Facebook posts for Leaders and Twitter tweets for the Public. To study the content shared on social media platforms, topic modeling and sentiment analysis techniques were used to gain insights into the sentiments, key topics, and discourse patterns surrounding the discussions on war. 
Suggesting a shared interest between the Public and Leaders, the results revealed overlapping topics of interest, including war, energy security, economy, sports, education, and news. However, distinct differences emerged, where Leaders mainly focused on discussing general themes such as domestic and foreign politics, while the public engaged in a more diverse range of topics. Public sentiment leaned towards negative, while the Leaders’ leaned towards neutral with variance among parties.
We conclude that analyzing social media data allowed us to focus on two different perspectives, political Leaders and the Public. The analyses provided valuable insights into the critical issues discussed by both groups and the impact of war and particular events on their posting activity.

# Files & Directories
* **fb_data_clean:** 
  * get_fb_data.ipynb: script for extracting relevant data from HAR files

* **leaders_analysis:**
  * leaders_preprocessing.ipynb: script for preprocessing
  * estbert_train_sentiment.ipynb: script for training sentiment model with EstBERT
  * BERTopic.ipynb: script for topic modeling with BERTopic
  * Sentiment_BERT.ipynb: script for BERT-based sentiment analysis with the pretrained model
  * Sentiment.R: sentiment analysis in R using syuzhet package
  * leaders_sentiment.ipynb: script for general analysis (BERT sentiment, valence model, Syuzhet), majority voting

* **public_analysis:**
  * twitter_get_usernames.ipynb: script to get the leaders Twitter usernames based on their name
  * twitter_get_data.ipynb: script to fetch the data (tweets)
  * twitter_preprocess.ipynb: script for preprocessing
  * public_BERTopic.ipynb: script for topic modeling with BERTopic
  * public_Sentiment_BERT.ipynb: script for BERT-based sentiment analysis with the pretrained model
  * sentiment.R: sentiment analysis in R using syuzhet package
  * public_sentiment.ipynb: script for general analysis (BERT sentiment, valence model, Syuzhet), majority voting
