R Interest Group Hands-On Workshop January 2013 
===========================================================
We will go over the handout [Introducing R](http://data.princeton.edu/R/) by G&eacute;rman Rodr&iacute;guez.  This page will highlight the benefits of using RStudio and add a few additional exercises to be used in combination with Dr. Rodr&iacute;guez' handout. 


*Note: We will refer to the 4 default RStudio pane layout as UL(Upper Left), UR (Upper Right), LR(Lower Right), LL(Lower Left) in this document.  Be sure to install the packages: ggplot2 and splines.*

### RStudio Projects

From the RStudio menu bar select Project--> Create Project.   Then select 'From New Directory'.  Create a new folder for your project.  This will be assumed to be your working directory for the session.  Once your new project has been created notice a few things:
* Locate the drop-down menu above the UR pane.  You can switch projects or set options specific to individual projects.
* If you had been using RStudio before, note that all panes have been cleared for your new project.   
* Look in the Files tab of the LR pane
* Confirm your working directory by typing the `getwd()` command in the LL console pane
* Close the project and reopen it. 
* Look at the RStudio preferences and compare them to the Project Options

### Section 2
R is updated frequently, if you want to know the current version, visit [http://cran.r-project.org](http://cran.r-project.org).   

R is installed on the PRI lab computers, however RStudio is currently only available on the PRI windows servers (kiev and moscow) and the PRI linux server (finland). 

### Section 2.2
As you work through some of the examples in section 2.2, be sure to examine your Workspace in the UR pane.

Programming languages deal with zero division differently.  In some cases any opertation attempting division by zero is prohibited.  R will allow you to proceed, but results vary.  Consider these calcuations...
```
1/0
0/0
-1/0
1/0 == 0/0
(1/0) == (-1/0)
(1/0) == (2/0)
1/0==0/0
# Store these values in a dataframe and print a table
v<-data.frame(c(0/0,1/0,-1/0,1/0==0/0))
table(v)
table(v,useNA='always')
```
Regardless of what stat package you use, always be aware that missing data is handled differently in every package.  Do not assume, verify your results.

### Section 2.3
For a list of matrix operators visit [http://www.statmethods.net/advstats/matrix.html](http://www.statmethods.net/advstats/matrix.html)

### R Scripts
The commands you have just entered are in your History in the UR pane.   Scroll back through the history to re-execute a command by sending it 'To Console'.   A better habit to establish is to store your commands in a script file.   Let's do this with all the commands you have run so far.  
* From the menu bar select File-->New-->R Script.   A new window will open in the UL pane
* Highlight all the commands in the history and select 'To Source'
* Select one or more commands in the UL script window and click on the 'Run' icon.  Now try the 'Source' icon to run the entire script.  
* Save your script.  Notice that the color of the tab label changes from red to black.


### Section 2.4
Try using the following statement to make a prettier plot with the ggplot2 package...
```
library(ggplot2)
qplot(z,d, type="l", main="The Standard Normal Density", col.main="cornflowerblue")
```
Use the Export menu in the Plots tab of the LR RStudio pane for easy options to save/copy your plot.

### Section 3.2 


#### Managing data
After reading data from an external source into R, you can save time in future sessions by saving the data as an R data frame.   Then if you clear the data from the workspace, you can retrieve it quickly.   Try saving the fpe data set to your working directory, clear it from your workspace and load it back in from the copy in your working directory.

```
save(fpe, file="fpe.Rdata" )
rm(fpe)
load(file="fpe.Rdata")
```
For the exercise on page 13, you can use RStudio to create a text file.  Be sure to hit <return> in the last line of data. There is also a little editor accessible with the `fix` function.


### Section 3.4

#### A few more commands to try:
What do these do?

```
head(fpe)
tail(fpe)
str(fpe)


# What's the difference?
table(fpe$setting)
table(fpe$effort==0,fpe$setting)
table(fpe$setting[fpe$effort==0])
table(fpe$setting[fpe$effort!=0], fpe$effort[fpe$effort!=0])

# Samples
fpe[sample(nrow(fpe), 10),]
fpe.sub1<-subset(fpe,effort!=0)
```

#### To attach or not to attach?
Most R afficionados advise against the use of `attach`.  One of the main reasons is that newly created variables are placed in the global workspace and not related to the attached data.  This means that you could intentionally or inadvertently have two variables with the same name.  This can be confusing.  Consider the following...


```r
library(ggplot2)
data(cars)
attach(cars)
```

Plot the variable distance, then modify the value of dist and re-plot.

```
plot(dist)
dist<-dist*10
plot(dist) 
```

Which distance did you plot the second time?  View the 'cars' dataframe in your Workspace.  How would you plot the original value?   To understand what's happening issue the command:

```
search()
```
RStudio encourages the use of fully-qualified names with the 'code completion' feature using the 'tab' key.   From the console or an Rscript editing window, **practice using this feature**.  Code completion works with names of objects as well as commands.  Try typing a few characters in the command line and hit tab, see what is displayed.


### Section 3.5
Note that when you use `Identify` the LR window will tell you that the command is active and you can use `esc` to exit.


### Section 4.4
Try examining *effort* and *effortg* with display, table and plot commands.   
<!--  PROBABLY NEED A WORKSHOP ON FACTOR VARS -->


### Section 5.2

Consider the calculation on page 28:
```
1-pchisq(29.92,10)
```

What if you wanted to calculate this in a program without knowing the values in advance?   This is where extractor functions come in.

Look at the object lrfit generated by the `glm` function.  

* What package creates this object?  
* How can you extract the values?  Read documentation.
* Re-write the calucalation

<!--  1-pchisq(deviance(lrfit), df.residual(lrfit)) -->

### Section 5.4
On page 33, the step command should refer to the object 'lrfit0', not 'additive'

### Section 6
Type the statements to calculate a logit for the values of vector of proportions *p* .
```
p<-c(.5, .3, .6)
log(p/(1-p))
```
Now highlight your code and look for the magic wand in the UL pane.  Select the 'Extract Function' option, supply the function name 'logit' and RStudio will supply the punction to define your function.  Use the `Run` command and note that your function is now in your workspace.  

### More references:
__RStudio tutorials__

http://www.rstudio.com/ide

__Quick command summaries__

http://www.statmethods.net/advstats/matrix.html

__A fun and informative blog__

http://www.r-bloggers.com

__Tutorial on qplot/ggplot2__

http://www.ceb-institute.org/bbs/wp-content/uploads/2011/09/handout_ggplot2.pdf
