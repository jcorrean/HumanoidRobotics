library(bibliometrix)

FILE <- "Humanoid.txt"

M <- convert2df(file = FILE,
                dbsource = "wos", format = "plaintext")

# este paso es obligatorio
M <- metaTagExtraction(M, Field = "AU_CO", sep = ";")

variable.names(M)
summary(M$PY)
# 3. Calcular la matriz de colaboración por países
NetMatrix <- biblioNetwork(M, 
                           analysis = "collaboration", 
                           network = "countries", 
                           sep = ";")

# 4. Generar el mapa mundial de colaboración
networkPlot(NetMatrix,
            n = 50,
            type = "fruchterman",
            Title = "Countries Collaboration Network",
            cluster = "none")


thematicMap(
 M,
 field = "TI",
 n = 250,
 minfreq = 5,
 ngrams = 2,
 stemming = FALSE,
 size = 0.5,
 n.labels = 1,
 community.repulsion = 0.5,
 repel = TRUE,
 remove.terms = NULL,
 synonyms = NULL,
 cluster = "louvain",
 subgraphs = FALSE,
 alpha = 0.5,
 seed = 1234
)
