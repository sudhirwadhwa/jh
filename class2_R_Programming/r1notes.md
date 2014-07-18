##  #####################################################################
##1

Reading Data ( and bringing it in R ( RStudio)

Goal: To read SyntheticDataFinal.csv file in RStudio and Load it. SyntheticDataFinal.csv file is located in /Users/sudhirwadhwa/datatrack/jh/class2_R_Programming Directory. This is a CSV ( Comma Separated file)


Fucntions read.csv(), read.table()
load into a data.frame,  an existing data ﬁle

In my case Header = True (First Row is a Header). Sep is a comma ( its a CSV file)
I will read the fill and assign to data frame masterSAT ( you can choose any name)



> masterSAT <- read.csv(file="/Users/sudhirwadhwa/datatrack/jh/class2_R_Programming/SyntheticDataFinal.csv",head=TRUE,sep=",")
>

( file is in Rstudio now)



##  #####################################################################
##2

Goal: To see the summary of the Data

> summary(masterSAT)
 POBStudent     POBParent  Parent1Education Parent2Education ZipPostalCode   PrivateSchool SATCoaching   SAT.Score   
 USA:99     India    :34   B   :50          B:76             Min.   :90017   No :45        No  :31     Min.   : 698  
            China    :20   M   :31          M:23             1st Qu.:94022   Yes:54        Yes :48     1st Qu.:1234  
            USA      :12   P   : 3                           Median :94035                 NA's:20     Median :2099  
            UK       :10   NA's:15                           Mean   :93919                             Mean   :1788  
            Australia: 5                                     3rd Qu.:95016                             3rd Qu.:2205  
            Japan    : 5                                     Max.   :95070                             Max.   :2400  
            (Other)  :13      

Few Observation about the Data: 54 students went to Private School, 48 Students took private coaching to prepare for SAT,  34 students in the Data provided are Indians , 20 are Chinese. There were 50 Parent1 and 76 Parent2 with Bach degree. 


 The str() display the internal structure of an R object

> str(masterSAT)
'data.frame':	99 obs. of  8 variables:
 $ POBStudent      : Factor w/ 1 level "USA": 1 1 1 1 1 1 1 1 1 1 ...
 $ POBParent       : Factor w/ 10 levels "Australia","China",..: 3 3 2 2 9 9 2 2 7 7 ...
 $ Parent1Education: Factor w/ 3 levels "B","M","P": 2 1 2 3 NA NA 2 2 2 2 ...
 $ Parent2Education: Factor w/ 2 levels "B","M": 2 1 1 2 2 2 2 1 1 1 ...
 $ ZipPostalCode   : int  95070 95014 94587 90017 90017 90017 90017 90017 90017 90025 ...
 $ PrivateSchool   : Factor w/ 2 levels "No","Yes": 2 2 2 1 2 2 2 1 2 2 ...
 $ SATCoaching     : Factor w/ 2 levels "No","Yes": 2 1 1 1 1 2 2 2 2 1 ...
 $ SAT.Score       : int  2210 2100 2000 2200 2345 2200 2200 1290 2134 1999 ...


There are 99 observations ( records) and 8 vasiables are there ( POBStudent, POBParent, Parent1Education, Parent2Education, ZipPostalCode, PrivateSchool, SATCoaching, SAT.Score)

Now I want to see just the names of the 8 Variables.

> names(masterSAT)
[1] "POBStudent"       "POBParent"        "Parent1Education"
[4] "Parent2Education" "ZipPostalCode"    "PrivateSchool"   
[7] "SATCoaching"      "SAT.Score"       
> 

What is the dimesnion of my data set?

> dim(masterSAT)
[1] 99  8


99 observation and 8 variables


 So, dim() , str() , names() , summary() tell you lot about your dataset.




##  #####################################################################
##3


Goal: To see the Class of File we read and now available in RStudio

> masterSAT <- read.csv(file="/Users/sudhirwadhwa/datatrack/jh/class2_R_Programming/SyntheticDataFinal.csv",head=TRUE,sep=",")
> ls()
[1] "masterSAT"
> class(masterSAT)
[1] "data.frame"
> 


so the class of masterSAT is data.frame
and note ls() lists the Object in current Environment ( You will soon see the importance of Environment)


##  #####################################################################
##4

Goal: How do I see ALL Observations with only POBParent and SAT.Score?

( that means column 2 and column 8)
Remember we count with #1 , so POBStudent is Column number 1 , POBParent is Column number 2 and so on...
SAT.Score is Column number 8


> PobParentAndSAT <- masterSAT[, c(2,8)]
> PobParentAndSAT
   POBParent SAT.Score
1      India      2210
2      India      2100
3      China      2000

( record number 4 ro 97  truncated)

98     India      2400
99     India      2400





##  #####################################################################
##5

Goal: We want see SAT Score of all the students whose Parents were born in Australia.
( that means you are dealing with POBParent or Column number 2
also there is a condition which says must have Value Australia)

> satParentAus <- masterSAT[masterSAT$POBParent == "Australia", ]
> satParentAus
   POBStudent POBParent Parent1Education Parent2Education ZipPostalCode PrivateSchool SATCoaching SAT.Score
78        USA Australia                B                B         94035           Yes         Yes      2100
79        USA Australia                B                B         94035            No          No       999
80        USA Australia                M                B         94035            No          No       698
81        USA Australia                M                M         94035           Yes        <NA>       745
84        USA Australia                B                B         94035           Yes        <NA>       890


##  #####################################################################
##6


Goal : What is the qualification of Parent1 for observation / record # 23 ?
( that means, we want column 3 )
How do you refer to Coulmn 3 (Parent1Education)  and record number 23  ?

> Parent1EducationData <- masterSAT$Parent1Education
> Parent1EduRow23 <- masterSAT$Parent1Education[23]
> Parent1EduRow23
[1] <NA>
Levels: B M P



##  #####################################################################
##7

Goal : I want to find out everyone who scored perfect? 2400

> perfectScore <- masterSAT[masterSAT$SAT.Score == 2400, ]
> perfectScore
   POBStudent POBParent Parent1Education Parent2Education ZipPostalCode PrivateSchool SATCoaching SAT.Score
14        USA        UK                B                B         93513           Yes          No      2400
41        USA     India             <NA>                B         94022            No          No      2400
42        USA        UK                M                B         94022            No         Yes      2400
64        USA    Taiwan                B                B         95062            No          No      2400
70        USA     India                M                B         94022           Yes        <NA>      2400
92        USA     India                B                B         94027           Yes         Yes      2400
98        USA     India                M                B         95014           Yes         Yes      2400
99        USA     India                M                B         95014           Yes         Yes      2400
> 



##  #####################################################################
##8
Goal : I want to see everyone who took SATCoaching and scored perfect 2400


> perfectScore <- masterSAT[which(masterSAT$SAT.Score == 2400 & masterSAT$SATCoaching == "Yes") ,]
> perfectScore
   POBStudent POBParent Parent1Education Parent2Education ZipPostalCode PrivateSchool SATCoaching SAT.Score
42        USA        UK                M                B         94022            No         Yes      2400
92        USA     India                B                B         94027           Yes         Yes      2400
98        USA     India                M                B         95014           Yes         Yes      2400
99        USA     India                M                B         95014           Yes         Yes      2400
> 



NOTE:

Subset : I need an example of [ , [[ and $ for subset 




##  #####################################################################
##9
Goal : I want to see only ZipPostalCode of Students who scored perfect 2400.
( that means we display only ZipPostalCode and not all 8 variables)


> perfectZipToLive <- subset(masterSAT, SAT.Score == 2400, select = c(ZipPostalCode))
> perfectZipToLive
   ZipPostalCode
14         93513
41         94022
42         94022
64         95062
70         94022
92         94027
98         95014
99         95014
> 


##  #####################################################################
##10

Goal: BTW, what was education of both parents who scored perfect 2400 SAT Score?

( that means you display 2 vaiables Parent1Education and Parent2Education, with SAT.Score == 2400)


> parentEduPerfectSAT <- subset(masterSAT, SAT.Score == 2400, select = c(Parent1Education, Parent2Education))
> parentEduPerfectSAT
   Parent1Education Parent2Education
14                B                B
41             <NA>                B
42                M                B
64                B                B
70                M                B
92                B                B
98                M                B
99                M                B
> 


















































How do I get working directory in R?
How do I set directory in R
How do i list files / folders in working directory in R
=========================================================

> getwd()
[1] "/Users/sudhirwadhwa"
> setwd("~/datatrack")
> getwd()
[1] "/Users/sudhirwadhwa/datatrack"
> getwd()
[1] "/Users/sudhirwadhwa/datatrack"
> 
> dir()
[1] "datasciencecoursera" "jh"                  "modules"            
[4] "notes"               "play"               
> 

How do I run R program in Batch Mode?


Use vi to create a file in your current working dir.
Sudhirs-MacBook-Pro:rcodes sudhirwadhwa$ cat hello.R 
a <- c ("hello me!!!")
print (a)


Run it in Batch Mode

Sudhirs-MacBook-Pro:rcodes sudhirwadhwa$ R --vanilla --slave < hello.R
[1] "hello me!!!"
Sudhirs-MacBook-Pro:rcodes sudhirwadhwa$ pwd

/Users/sudhirwadhwa/datatrack/jh/rcodes



How do I understand the structure of data (file)?




> install.packages("vcd")
trying URL 'http://cran.rstudio.com/bin/macosx/mavericks/contrib/3.1/vcd_1.3-1.tgz'
Content type 'application/x-gzip' length 1108266 bytes (1.1 Mb)
opened URL
==================================================
downloaded 1.1 Mb


The downloaded binary packages are in
	/var/folders/ks/vvq5_4b5099c8n69vxsnrxzc0000gn/T//Rtmpjc8xbM/downloaded_packages
> ls()
 [1] "diamonds"         "givemetable"      "hun"              "hundred"         
 [5] "loo"              "loop"             "lop"              "say.double"      
 [9] "say.firstandlast" "say.hello"        "x"               



> library(vcd)
Loading required package: grid
> library(vcd)

## Data Set Arthritis 


> Arthritis
   ID Treatment    Sex Age Improved
1  57   Treated   Male  27     Some
2  46   Treated   Male  29     None
3  77   Treated   Male  30     None
4  17   Treated   Male  32   Marked
5  36   Treated   Male  46   Marked
6  23   Treated   Male  58   Marked
7  75   Treated   Male  59     None
8  39   Treated   Male  59   Marked
9  33   Treated   Male  63     None
10 55   Treated   Male  63     None
11 30   Treated   Male  64     None
12  5   Treated   Male  64     Some
13 63   Treated   Male  69     None
14 83   Treated   Male  70   Marked
15 66   Treated Female  23     None
16 40   Treated Female  32     None
17  6   Treated Female  37     Some
18  7   Treated Female  41     None
19 72   Treated Female  41   Marked
20 37   Treated Female  48     None
21 82   Treated Female  48   Marked
22 53   Treated Female  55   Marked
23 79   Treated Female  55   Marked
24 26   Treated Female  56   Marked
25 28   Treated Female  57   Marked
26 60   Treated Female  57   Marked
27 22   Treated Female  57   Marked
28 27   Treated Female  58     None
29  2   Treated Female  59   Marked
30 59   Treated Female  59   Marked
31 62   Treated Female  60   Marked
32 84   Treated Female  61   Marked
33 64   Treated Female  62     Some
34 34   Treated Female  62   Marked
35 58   Treated Female  66   Marked
36 13   Treated Female  67   Marked
37 61   Treated Female  68     Some
38 65   Treated Female  68   Marked
39 11   Treated Female  69     None
40 56   Treated Female  69     Some
41 43   Treated Female  70     Some
42  9   Placebo   Male  37     None
43 14   Placebo   Male  44     None
44 73   Placebo   Male  50     None
45 74   Placebo   Male  51     None
46 25   Placebo   Male  52     None
47 18   Placebo   Male  53     None
48 21   Placebo   Male  59     None
49 52   Placebo   Male  59     None
50 45   Placebo   Male  62     None
51 41   Placebo   Male  62     None
52  8   Placebo   Male  63   Marked
53 80   Placebo Female  23     None
54 12   Placebo Female  30     None
55 29   Placebo Female  30     None
56 50   Placebo Female  31     Some
57 38   Placebo Female  32     None
58 35   Placebo Female  33   Marked
59 51   Placebo Female  37     None
60 54   Placebo Female  44     None
61 76   Placebo Female  45     None
62 16   Placebo Female  46     None
63 69   Placebo Female  48     None
64 31   Placebo Female  49     None
65 20   Placebo Female  51     None
66 68   Placebo Female  53     None
67 81   Placebo Female  54     None
68  4   Placebo Female  54     None
69 78   Placebo Female  54   Marked
70 70   Placebo Female  55   Marked
71 49   Placebo Female  57     None
72 10   Placebo Female  57     Some
73 47   Placebo Female  58     Some
74 44   Placebo Female  59     Some
75 24   Placebo Female  59   Marked
76 48   Placebo Female  61     None
77 19   Placebo Female  63     Some
78  3   Placebo Female  64     None
79 67   Placebo Female  65   Marked
80 32   Placebo Female  66     None
81 42   Placebo Female  66     None
82 15   Placebo Female  66     Some
83 71   Placebo Female  68     Some
84  1   Placebo Female  74   Marked
> 


How do I See top 10 from my data set?


> head (Arthritis,10)
   ID Treatment  Sex Age Improved
1  57   Treated Male  27     Some
2  46   Treated Male  29     None
3  77   Treated Male  30     None
4  17   Treated Male  32   Marked
5  36   Treated Male  46   Marked
6  23   Treated Male  58   Marked
7  75   Treated Male  59     None
8  39   Treated Male  59   Marked
9  33   Treated Male  63     None
10 55   Treated Male  63     None



> dim(Arthritis)
[1] 84  5
> str(Arthritis)
'data.frame':	84 obs. of  5 variables:
 $ ID       : int  57 46 77 17 36 23 75 39 33 55 ...
 $ Treatment: Factor w/ 2 levels "Placebo","Treated": 2 2 2 2 2 2 2 2 2 2 ...
 $ Sex      : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 2 2 2 2 ...
 $ Age      : int  27 29 30 32 46 58 59 59 63 63 ...
 $ Improved : Ord.factor w/ 3 levels "None"<"Some"<..: 2 1 1 3 3 3 1 3 1 1 ...
> 


How do I get Summary of my data?
> summary(Arthritis)
       ID          Treatment      Sex          Age          Improved 
 Min.   : 1.00   Placebo:43   Female:59   Min.   :23.00   None  :42  
 1st Qu.:21.75   Treated:41   Male  :25   1st Qu.:46.00   Some  :14  
 Median :42.50                            Median :57.00   Marked:28  
 Mean   :42.50                            Mean   :53.36              
 3rd Qu.:63.25                            3rd Qu.:63.00              
 Max.   :84.00                            Max.   :74.00       


How about summary of those where Age > 65

> summary ( subset(Arthritis, Age>65))
       ID          Treatment     Sex          Age          Improved
 Min.   : 1.00   Placebo:5   Female:12   Min.   :66.00   None  :4  
 1st Qu.:19.25   Treated:9   Male  : 2   1st Qu.:66.25   Some  :5  
 Median :49.50                           Median :68.00   Marked:5  
 Mean   :43.86                           Mean   :68.29             
 3rd Qu.:62.50                           3rd Qu.:69.00             
 Max.   :83.00                           Max.   :74.00             
> 

How do I sort my dataset ?





How do I find what datasets are available in R Package?
library(MASS)
data()



