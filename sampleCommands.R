# Explore
fpe[sample(nrow(fpe),8)]
table(fpe$setting[fpe$effort==0])
table(fpe$setting[fpe$effort!=0], fpe$effort[fpe$effort!=0])
fpe.sub1<-subset(fpe,effort!=0)

# Why not use attach?
attach(fpe)
table(effort)
effort<-effort + 1
search()
table(fpe$effort)

######## Factors may be worth an entire session
# http://www.stat.berkeley.edu/classes/s133/factors.html

# variable gender with 20 "male" entries and 
# 30 "female" entries 
gender <- c(rep(1,20), rep(0, 30)) 
plot(gender)
table(gender)
gender <- factor(gender) 
plot(gender)
table(gender)
# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable 


# variable v1 is coded 1, 2 or 3
# we want to attach value labels 1=red, 2=blue, 3=green
mydata<-data.frame(v1=sample(1:3,50, replace=TRUE))

mydata$v1 <- factor(mydata$v1,
                    levels = c(1,2,3),
                    labels = c("red", "blue", "green"))

# Add variable y is coded 1, 3 or 5 
mydata$y<-c(rep(1,13),rep(3,12),rep(5,25))
plot(mydata$y)
# we want to attach value labels 1=Low, 3=Medium, 5=High
mydata$y.f <- factor(mydata$y,
                     levels = c(1,3, 5),
                     labels = c("Low", "Medium", "High"))
unclass(mydata$y.f)
mydata$y.of <- ordered(mydata$y,
                     levels = c(1,3, 5),
                     labels = c("Low", "Medium", "High"))

# Ask whether Jason has shown them 'with'

# Fix
x<-data.frame()
fix(x)