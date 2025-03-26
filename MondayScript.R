#This is a comment
#Basics:This is a header####
#Logical operators: what I will have as a result is a TRUE or FALSE to my operator.
3>4
C<-3<4
3<=4
3==4
3!=4 #If it is not equal to

#Naming conventions: no special characters, no spaces, no just numbers but combine with letters, names that make sense
#NameLastName or Name_Last_Name or Name.Last.Name or nameLastName, etc

#Object classes:
#1. Numerical
#2. Logical (True or False)
#3. Character ("Green" or "Carol")
#4. Factor (Male vs Female, dog or cat)

#First task####

AverageWH<-(8+8+10+4+5)/5
NumDays_BIGSDR<-(365-15)*3

TotalWH<-AverageWH*NumDays_BIGSDR

#Scholarship_Month
1300
#Scholarship_Day
1300/30
#PossibleSalary: Aprox. 1500 Euros a month
6500000/4300
#OpportunityCosts

OpportunityCost<-(1500*36)-(1300*36)

#Even when I am "losing" about 7200 Euros during the study period here in Germany, the earns in experience and personal growth should be amazingly bigger than the opportunity cost.

#Vectors####
#To create a vector we will use the function c
vec1<-c(2,4,6,4,1) 
#I will see that "c" is for numerical and then the number of components inside the vector, and the list. 
#or I can create a set from x to y like:
vec2<-c(1:10)
#To index a vector:
vec1[2] #Is going to bring me the second number of the set.
vec1[2]<-3 #I am going to replace the second number for the number 3
#Calculate:
sum(vec1)
meanVector<-mean(vec1)
#para crear secuencias de datos:

vec3<-seq(from=10,to=100,length=10) #del 10 al 100 en intervalos de 10.
vec3minus<-vec3-4 #a cada número del vector le voy a restar 4
vec3plus<-vec3+vec3minus #a cada número de un vector le voy a sumar el correspondiente de otro.

length(vec3) #To know haw long is a vector

#logical questions about the vectors:

vec3<70
vec3[2:8] #here I select the second to the eight value
#but if I want to see just a selection of numbers:
vec3[vec3<80&vec3>20]

#Second task####
WH_Last5Days<-c(10,1,5,8,8)
SH_Last5Days<-c(7,10,4,6,6)
MeanWH<-mean(WH_Last5Days)
MeanSH<-mean(SH_Last5Days)
MeanSH
MeanWH
LeisureTime<-24-WH_Last5Days-SH_Last5Days
#On how many days did I have more than 6 but less than 10 hours of leisure time:
LeisureTime[LeisureTime<10&LeisureTime>6] #I see here the data which fit with my criteria: 7
length(LeisureTime[LeisureTime<10&LeisureTime>6]) #I see here the number of data that fits: 1
#Just one day, the rest more than 10 leisure hours, but it was weekend!

#Dataframes####
#Now I creat not just a set of data but many, so a database

data1<-data.frame(Vector1=vec2,Vector2=vec3,Vector3=vec3minus) #I rename the vectors previously created
data1
data1[3] #To call a column by the place where it is
data1$Vector1 #To call a column (second possibility) by the name
data1[3,1] #To call a XY cell
data1[4,] #To call a row and all the columns

data1
data1$Vector4<-c(5,4,2,7,9,5,6,0,1,4) #Create a new column
data1$Vector5<-data1$Vector2+data1$Vector3 #Create a new column from an operation of the others.
data1
c(data1)<-letters[1:10] #Indexing rows
data1

head(data1) #Quick view of the database
str(data1) #Show the main info. about the database, number of observations and of variables, heads of the variables and type of data
colnames(data1) #show the name of the columns

BigVec2<-data1[data1$Vector2>50,]
BigVec2  #New dataset from the original one with the big numbers

SmallVec2<-data1[data1$Vector2<=50,]
SmallVec2 #New dataset from the original one with the small numbers

#Third task####

dataMe<-data.frame(Work=WH_Last5Days,Sleep=SH_Last5Days,Leisure=LeisureTime)
dataMe
row.names(dataMe)<-c("W","Th","F","Sa","Su")
dataMe
dataMe$Day<-c((rep("W",3)), (rep("H",2)))
dataMe
plot(dataMe$Work,dataMe$Sleep)
str(dataMe)              
plot(dataMe$Work, dataMe$Sleep, pch = 16, col = "blue", xlab = "Horas de Trabajo", ylab = "Horas de Sueño", main = "Relación Trabajo-Sueño")
text(dataMe$Work, dataMe$Sleep, labels = dataMe$Day, pos = 3, col = "red")
plot(dataMe$Sleep,dataMe$Work)
plot(dataMe$Work,dataMe$Sleep)
plot(dataMe$Work, dataMe$Sleep, 
     pch = 16, col = "blue", 
     xlab = "Work hours", 
     ylab = "Sleep hours", 
     main = "Work vs Sleep",
     xlim = c(0, max(dataMe$Work)),  # Eje X inicia en 0
     ylim = c(0, max(dataMe$Sleep))  # Eje Y inicia en 0
)


#Import and export databases####
#Import
courseData<-read.table("participants_data.csv", sep=",", header = TRUE) #Header TRUE let me see the first rows as the header columns: file imported
head(courseData)
#Export
write.table(courseData, "participants_data2.csv", sep = ",") #I am creating a second file from the previous one: file exported


#Functions####
#anyfunction(arg,arg1,arg2...)

myFunction<-function(arg1,arg2)
{
  arg1+arg2
}

myFunction(5,6)
#Packages####
install.packages("raster")
library(raster)
#With ? I can have help to understand which function is and what is important for
?raster
ls("package:raster") #Now I am seeing the list of functions included in the package already installed.
#Additional Task####
courseData
head(courseData)
plot(courseData$age,courseData$number_of_publications)

femaleData<-courseData[courseData$gender== "F", ]
maleData<-courseData[courseData$gender== "M", ]
mean(femaleData$age)
mean(maleData$age)
sd(femaleData$age)
sd(maleData$age)
mean(femaleData$number_of_publications)
mean(maleData$number_of_publications)
sd(femaleData$number_of_publications)
sd(maleData$number_of_publications)

GenderData<-data.frame(Gender=courseData$gender, Age=courseData$age, NumPublications=courseData$number_of_publications)
head(GenderData)
write.table(GenderData, "participants_dataG.csv", sep = ",")

MeanGender<-c(mean(femaleData$age), mean(maleData$age))
SDGender<-c(sd(femaleData$age), sd(maleData$age))
MeanPublications<-c(mean(femaleData$number_of_publications), mean(maleData$number_of_publications))
SDPublications<-c(sd(femaleData$number_of_publications),sd(maleData$number_of_publications))

MeanData<-data.frame(MeanGender,SDGender,MeanPublications,SDPublications)
MeanData
row.names(MeanData)<-c("Female", "Male")
MeanData
write.table(MeanData, "participants_dataGMean.csv", sep = ",")
MeanData
