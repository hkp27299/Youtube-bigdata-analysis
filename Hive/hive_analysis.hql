create table YouTube_data_table (vedioid STRING,uploader STRING, age INT, category STRING, length INT, noofviews INT, no_of_comments INT, IDs INT) 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

set hive.cli.print.header=true;

LOAD DATA LOCAL INPATH '/Users/alaknanda/Desktop/Youtube_Bigdata_Analysis/PigAnalysisData/YouTubeData.csv' OVERWRITE INTO TABLE YouTube_data_table;


