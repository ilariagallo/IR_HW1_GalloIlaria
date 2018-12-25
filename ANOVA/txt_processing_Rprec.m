%Open the file with trec_eval results for the BM25_StopW_PortStem run
fileID = fopen('BM25_StopW_PortStem.txt','r');

%Initialize the Rprec values vector
Rprec_BM25_SW_PS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID);
while and(ischar(line), count<=50)
   if strncmp(line,'Rprec ', 6)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       Rprec_BM25_SW_PS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID);
   else
       line = fgetl(fileID);
   end
end


%Open the file with trec_eval results for the TFIDF_StopW_PortStem run
fileID1 = fopen('TFIDF_StopW_PortStem.txt','r');

%Initialize the Rprec values vector
Rprec_TFIDF_SW_PS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID1);
while and(ischar(line), count<=50)
   if strncmp(line,'Rprec ', 6)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       Rprec_TFIDF_SW_PS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID1);
   else
       line = fgetl(fileID1);
   end
end

%Open the file with trec_eval results for the BM25_PortStem run
fileID2 = fopen('BM25_PortStem.txt','r');

%Initialize the Rprec values vector
Rprec_BM25_PS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID2);
while and(ischar(line), count<=50)
   if strncmp(line,'Rprec ', 6)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       Rprec_BM25_PS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID2);
   else
       line = fgetl(fileID2);
   end
end

%Open the file with trec_eval results for the TFIDF_noSt_noPS run
fileID3 = fopen('TFIDF_noSt_noPS.txt','r');

%Initialize the Rprec values vector
Rprec_TFIDF_noSW_noPS = zeros(50, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID3);
while and(ischar(line), count<=50)
   if strncmp(line,'Rprec ', 6)
       C = textscan(line,'%s %d %f');
       c = cell2mat(C(1,3));
       Rprec_TFIDF_noSW_noPS(count, 1) = c;
       count = count + 1;
       line = fgetl(fileID3);
   else
       line = fgetl(fileID3);
   end
end

%Build a matrix where the columns are Rprec vectors from different runs
measure = [Rprec_BM25_SW_PS, Rprec_TFIDF_SW_PS, Rprec_BM25_PS, Rprec_TFIDF_noSW_noPS];

runID = {'BM25 SW PS', 'TFIDF SW PS', 'BM25 PS', 'TFIDF noSW noPS'};
topicID = zeros(1,50);

n_topic=351;
for j=1:50
    topicID(1,j) = n_topic;
    n_topic = n_topic + 1;
end
topicID = num2cell(topicID);

save ap_Rprec.mat measure runID topicID