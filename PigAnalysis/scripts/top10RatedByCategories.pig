infiles = load '/Users/alaknanda/Desktop/Youtube_Bigdata_Analysis/PigAnalysisData/YouTubeData.csv' using PigStorage(',') as 
(videoid:chararray,uploader:chararray,age:int,category:chararray,length:int,views:int,rate:int,rating:int,comments:int,related_id:chararray);
files = FILTER infiles BY category is not null;
grpn_for_catagories = group files by category;
top10_rated_catagories = foreach grpn_for_catagories{
                           sorted = order files by rating desc;
                           top10 = limit sorted 10;
                           generate flatten(top10);
};
top10_rated_by_catagories = foreach top10_rated_catagories generate $0,$3,$7;
STORE top10_rated_by_catagories INTO '/Users/alaknanda/Desktop/Youtube_Bigdata_Analysis/PigAnalysisOutput/Top10RatedByCatagories.pig' using PigStorage(',');
