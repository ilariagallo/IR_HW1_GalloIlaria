%Open the file with the trec_eval results for the BM25_StopW_PortStem run
fileID = fopen('BM25_StopW_PortStem.txt','r');

%Initialize the vector of iprec_at_recall values
iprecBM25_SW_PS = zeros(11, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID);
while and(ischar(line), count<=561)
   if strncmp(line,'iprec_at_recall', 15)
       
       %Select only the average value computed 
       %on all the topic for iprec(the ones with 'all')  
       if(count>=551)
         C = textscan(line,'%s %s %f');
         c = cell2mat(C(1,3));
         iprecBM25_SW_PS(count-550, 1) = c;
       end
       line = fgetl(fileID);
       count = count + 1;
   else
       line = fgetl(fileID);
   end
end

%Open the file with the trec_eval results for the TFIDF_StopW_PortStem run
fileID = fopen('TFIDF_StopW_PortStem.txt','r');

%Initialize the vector of iprec_at_recall values
iprecTFIDF_SW_PS = zeros(11, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID);
while and(ischar(line), count<=561)
   if strncmp(line,'iprec_at_recall', 15)
       
       %Select only the average value computed 
       %on all the topic for iprec(the ones with 'all')  
       if(count>=551)
         C = textscan(line,'%s %s %f');
         c = cell2mat(C(1,3));
         iprecTFIDF_SW_PS(count-550, 1) = c;
       end
       line = fgetl(fileID);
       count = count + 1;
   else
       line = fgetl(fileID);
   end
end

%Open the file with the trec_eval results for the BM25_PortStem run
fileID = fopen('BM25_PortStem.txt','r');

%Initialize the vector of iprec_at_recall values
iprecBM25_PS = zeros(11, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID);
while and(ischar(line), count<=561)
   if strncmp(line,'iprec_at_recall', 15)
       
       %Select only the average value computed 
       %on all the topic for iprec(the ones with 'all')  
       if(count>=551)
         C = textscan(line,'%s %s %f');
         c = cell2mat(C(1,3));
         iprecBM25_PS(count-550, 1) = c;
       end
       line = fgetl(fileID);
       count = count + 1;
   else
       line = fgetl(fileID);
   end
end

%Open the file with the trec_eval results for the TFIDF_noSt_noPS run
fileID = fopen('TFIDF_noSt_noPS.txt','r');

%Initialize the vector of iprec_at_recall values
iprecTFIDF_noSW_noPS = zeros(11, 1);
count = 1;

%Scan the txt file line by line
line = fgetl(fileID);
while and(ischar(line), count<=561)
   if strncmp(line,'iprec_at_recall', 15)
       
       %Select only the average value computed 
       %on all the topic for iprec(the ones with 'all')  
       if(count>=551)
         C = textscan(line,'%s %s %f');
         c = cell2mat(C(1,3));
         iprecTFIDF_noSW_noPS(count-550, 1) = c;
       end
       line = fgetl(fileID);
       count = count + 1;
   else
       line = fgetl(fileID);
   end
end


%%plot the data

    x = [0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
    y1 = iprecBM25_SW_PS;
    y2 = iprecTFIDF_SW_PS;
    y3 = iprecBM25_PS;
    y4 = iprecTFIDF_noSW_noPS;
    
    plot(x, y1,'r', x, y2,'g', x, y3, 'b', x, y4,'y')
    legend('BM25 SW PS', 'TFIDF SW PS', 'BM25 PS', 'TFIDF noSW noPS')
    xlabel('Recall'),ylabel('Precision')
