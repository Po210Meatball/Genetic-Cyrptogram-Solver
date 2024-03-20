##genetic cryptogram
set.seed(7)
#Nothing was your own except the few cubic centimeters inside your skull

library(qdapDictionaries)

###Variables

pop_size=5000
top_x=50
mutateable_locations_vec=c(1,3,4,5,6,8,10,11,12,13,14,16,17,18,19,20,21,22,23,24,25,26)
mutation_rate=0.15
num_generations=25
most_fit_this_gen=list()


vec=letters[1:26]
vec=vec[!vec =="c"]
vec=vec[!vec =="g"]
vec=vec[!vec =="o"]
vec=vec[!vec =="s"]

###create an individual with 26 genes randomly assigned at 22 of them
### add them to a population list
pop=list()
for (x in 1:pop_size) {
  genes= sample(vec,22,replace=FALSE)
  genes <- append(genes, "s", after=1)
  genes <- append(genes, "o", after=6)
  genes <- append(genes, "c", after=8)
  genes <- append(genes, "g", after=14)
  pop[[length(pop)+1]] <- genes    # initialize a vector of values

}

for (gen in 1:num_generations){
## get fitness for each individual in pop
  
  fitness_vector=c()
  for (organism in pop){
    w_1=paste(organism[1],organism[7],organism[16],organism[8],organism[18],organism[1],organism[15],sep="")
    w_2=paste(organism[22],organism[6],organism[2],sep="")
    w_3=paste(organism[4],organism[7],organism[11],organism[20],sep="")
    w_4=paste(organism[7],organism[22],organism[1],sep="")
    w_5=paste(organism[13],organism[17],organism[9],organism[13],organism[14],organism[16],sep="")
    w_6=paste(organism[16],organism[8],organism[13],sep="")
    w_7=paste(organism[24],organism[13],organism[22],sep="")
    w_8=paste(organism[9],organism[11],organism[3],organism[18],organism[9],sep="")
    w_9=paste(organism[9],organism[13],organism[1],organism[16],organism[18],organism[26],organism[13],organism[16],organism[13],organism[20],organism[2],sep="")
    w_10=paste(organism[18],organism[1],organism[2],organism[18],organism[5],organism[13],sep="")
    w_11=paste(organism[4],organism[7],organism[11],organism[20],sep="")
    w_12=paste(organism[2],organism[10],organism[11],organism[12],organism[12],sep="")
    
    
    sentance=c(w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12)
   
    in_dict=sentance[sentance %in% GradyAugmented]
    y=intersect(in_dict, GradyAugmented)
    
    in_fry=sentance[sentance %in% Fry_1000]
    z=intersect(sentance, Fry_1000)
    factor1=(length(y)/12)
    factor2=length(z)/12
    fitness_score=factor1+factor2
    
    fitness_vector <- append(fitness_vector,fitness_score) 
  }
  
  most_fit=sort(fitness_vector,index.return=TRUE, decreasing=TRUE)
  tops=most_fit$ix[1:top_x]
  
 # print(pop[most_fit$ix[1]])
  ###mutations
  #print(pop)
  prodgeny_pop=list()
  #make a new population equal to the old one
  for (x in 1:pop_size){
    #pick a random organism from selected pop
    rand_num=sample(1:top_x,1,replace = TRUE)
    mom=(pop[most_fit$ix[rand_num]])
    mom=mom[[1]]
    ##mutate mother at x number of locations
    num_mutations=sum(sample(c(0:1),length(mutateable_locations_vec),replace = TRUE,prob = c(1-mutation_rate,mutation_rate)))
    
    if(num_mutations==1){
      num_mutations=2
    }
    
    gene_mutation_loci=sample(mutateable_locations_vec,num_mutations,replace = FALSE)
    child=mom
    child[gene_mutation_loci]=child[sample(gene_mutation_loci,length(gene_mutation_loci),replace = FALSE)]
    
    
    prodgeny_pop[[x]] <- child
    
    
  }
  most_fit_this_gen=append(most_fit_this_gen,pop[most_fit$ix[1]])
  pop=prodgeny_pop
  
  print(gen)
  
}
#view_evolution
for (organism in most_fit_this_gen){
  w_1=paste(organism[1],organism[7],organism[16],organism[8],organism[18],organism[1],organism[15],sep="")
  w_2=paste(organism[22],organism[6],organism[2],sep="")
  w_3=paste(organism[4],organism[7],organism[11],organism[20],sep="")
  w_4=paste(organism[7],organism[22],organism[1],sep="")
  w_5=paste(organism[13],organism[17],organism[9],organism[13],organism[14],organism[16],sep="")
  w_6=paste(organism[16],organism[8],organism[13],sep="")
  w_7=paste(organism[24],organism[13],organism[22],sep="")
  w_8=paste(organism[9],organism[11],organism[3],organism[18],organism[9],sep="")
  w_9=paste(organism[9],organism[13],organism[1],organism[16],organism[18],organism[26],organism[13],organism[16],organism[13],organism[20],organism[2],sep="")
  w_10=paste(organism[18],organism[1],organism[2],organism[18],organism[5],organism[13],sep="")
  w_11=paste(organism[4],organism[7],organism[11],organism[20],sep="")
  w_12=paste(organism[2],organism[10],organism[11],organism[12],organism[12],sep="")
  
  
  cat(w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,"\n")
  
}
