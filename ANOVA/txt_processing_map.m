%Open the file with trec_eval results for the BM25_StopW_PortStem run
fileID = fopen('BM25_StopW_PortStem.txt','r');

%Initialize the map values vector
mapBM25_SW_PS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID);
while and(ischar(line), count<=50)
   if strncmp(line,'map ', 4)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       mapBM25_SW_PS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID);
   else
       line = fgetl(fileID);
   end
end


%Open the file with trec_eval results for the TFIDF_StopW_PortStem run
fileID1 = fopen('TFIDF_StopW_PortStem.txt','r');

%Initialize the map values vector
mapTFIDF_SW_PS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID1);
while and(ischar(line), count<=50)
   if strncmp(line,'map ', 4)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       mapTFIDF_SW_PS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID1);
   else
       line = fgetl(fileID1);
   end
end

%Open the file with trec_eval results for the BM25_PortStem run
fileID2 = fopen('BM25_PortStem.txt','r');

%Initialize the map values vector
mapBM25_PS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID2);
while and(ischar(line), count<=50)
   if strncmp(line,'map ', 4)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       mapBM25_PS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID2);
   else
       line = fgetl(fileID2);
   end
end


%Open the file with trec_eval results for the TFIDF_noSt_noPS run
fileID3 = fopen('TFIDF_noSt_noPS.txt','r');

%Initialize the map values vector
mapTFIDF_noSW_noPS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID3);
while and(ischar(line), count<=50)
   if strncmp(line,'map ', 4)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       mapTFIDF_noSW_noPS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID3);
   else
       line = fgetl(fileID3);
   end
end

%Build a matrix where the columns are map vectors from different runs
measure = [mapBM25_SW_PS, mapTFIDF_SW_PS, mapBM25_PS, mapTFIDF_noSW_noPS];

runID = {'BM25 SW PS', 'TFIDF SW PS', 'BM25 PS', 'TFIDF noSW noPS'};
topicID = zeros(1,50);

n_topic=351;
for j=1:50
    topicID(1,j) = n_topic;
    n_topic = n_topic + 1;
end
topicID = num2cell(topicID);

save ap_map.mat measure runID topicID