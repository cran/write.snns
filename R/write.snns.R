	#################################################
	# write.snns.R (v0.0-2) 27-12-2000	 	#
	# University of La Rioja (SPAIN) 		#
	# Authors: 			 		#
	# Manuel Castejon Limas.			#
	# mail: manuel.castejon@dim.unirioja.es  	#
	# Joaquin Ordieres Mere.			#	
	# mail: joaquin.ordieres@dim.unirioja.es	#
	# Francisco Javier de Cos Juez			#
	# mail: francisco-javier.de-cos@dim.unirioja.es	#
	# Francisco Javier Martinez de Pison		#
	# mail: francisco.martinez@dim.unirioja.es	#
	#################################################

# This function creates a SNNS pattern file 
# from a data.frame or matrix.

write.snns <- function(x,file="", noutputs=1)
{
 file.create(file)
 cat(" SNNS pattern definition file v3.2\n", file=file, append=T)
 cat(paste("  generated at ",date(),"\n\n\n\n\n\n\n"), file=file, append=T)
 cat(paste(" No. of patterns      :",nrow(x),"\n"), file=file, append=T)
 cat(paste(" No. of input units   :",ncol(x)-noutputs,"\n"), file=file, append=T)
 cat(paste(" No. of output units  :",noutputs,"\n\n"), file=file, append=T)
 for (i in 1:nrow(x))
   {
      
      cat(paste("\n#",i,"\n"), file=file, append=T)
      numcol <- ncol(x)
      while( numcol >10)
         {
            line <- as.character(x[i,1])
            for(j in 2:10)
              line <- paste(line,x[i,j])
            cat(line, file=file, append=T)
            cat("\n", file=file, append=T)
            numcol <- numcol - 10
         }
      line <- as.character(x[i,1])
      for(j in 2:numcol)
        line <- paste(line,x[i,j])
      cat(line, file=file, append=T)
      cat("\n", file=file, append=T)
   }
}
