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