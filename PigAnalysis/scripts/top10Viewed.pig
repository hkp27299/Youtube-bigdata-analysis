infiles = load '/Users/alaknanda/Desktop/Youtube_Bigdata_Analysis/PigAnalysisData/YouTubeData.csv' using PigStorage(',') as 
(videoid:chararray,uploader:chararray,age:int,category:chararray,length:int,views:int,rate:int,rating:int,comments:int,related_id:chararray);
files = FILTER infiles BY category is not null;
order_viewed_video = order files by views desc;
top10_viewed_video = limit order_viewed_video 10;
final_top10_viewed_video = foreach top10_viewed_video generate $0,$3,$5;
STORE final_top10_viewed_video INTO '/Users/alaknanda/Desktop/Youtube_Bigdata_Analysis/PigAnalysisOutput/Top10Viewed.txt' using PigStorage(',');
