<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    
    <!-- Configuration de la sortie HTML -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <!-- Régularisation des espaces -->
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <!-- Mise en place des variables pour les fichiers de sortie -->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="path_homepage">
            <xsl:value-of select="concat($witfile, 'html/accueil', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_a_propos">
            <xsl:value-of select="concat($witfile, 'html/apropos', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_indexpers">
            <xsl:value-of select="concat($witfile, 'html/indexpers', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_indexplace">
            <xsl:value-of select="concat($witfile, 'html/indexplace', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_chapitre13N">
            <xsl:value-of select="concat($witfile, 'html/chap13Norm', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_chapitre14N">
            <xsl:value-of select="concat($witfile, 'html/chap14Norm', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_el13">
            <xsl:value-of select="concat($witfile, 'html/elmt13', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_el14">
            <xsl:value-of select="concat($witfile, 'html/elmt14', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_facsimile13">
            <xsl:value-of select="concat($witfile, 'html/fcsm13', '.html')"/>
        </xsl:variable>
        <xsl:variable name="path_facsimile14">
            <xsl:value-of select="concat($witfile, 'html/fcsm14', '.html')"/>
        </xsl:variable>
        
        
            <!-- Mise en place des variables pour les éléments frequemment utilisés -->
        <xsl:variable name="title">
            <xsl:value-of select="//fileDesc/titleStmt/title/text()"/>
        </xsl:variable>

        <xsl:variable name="author_surname">
            <xsl:value-of select="//titleStmt/author/surname"/>
        </xsl:variable>

        <xsl:variable name="author_forename">
            <xsl:value-of select="//titleStmt/author/forname"/>
        </xsl:variable>

        <xsl:variable name="author">
            <xsl:value-of select="concat($author_forename, $author_surname)"/>
        </xsl:variable>
        
        <xsl:variable name="title">
                <xsl:value-of select="//fileDesc/titleStmt/title/text()"/>
        </xsl:variable>

        <xsl:variable name="chap13_title">
            <xsl:value-of select="//monogr[@xml:id='Daniella21.01']/title/text()"/>
        </xsl:variable>

        <xsl:variable name="chap14_title">
            <xsl:value-of select="//monogr[@xml:id='Daniella22.01']/title/text()"/>
        </xsl:variable>
        
        
        <!--Mise en place de la variable footer, afin de faciliter la structuration des futures pages html-->
        <xsl:variable name="footer">
            <footer class="fixed-bottom" style="background-color:b40000">
                <div style="text-align:center;">
                    <p style="font-size:14px"><FONT color="white">2022 · Soline Doat · Technologies Numériques appliquée à l'histoire - Ecole nationale des chartes</FONT></p>
                </div>
            </footer>
        </xsl:variable>
        
        <!--Mise en place de la navbar, afin de faciliter la structuration des futures pages html-->
        <xsl:variable name="navbar">
            
            <!-- accès à la page d'accueil -->     
            <nav class="navbar navbar-expand-md justify-content-between">
                <a class="navbar-brand text-dark bg-white" href="{$path_homepage}">
                    <i><xsl:value-of select="$title"/></i>
                </a>
<!-- accès aux éditions des chapitres -->
                <ul class="navbar-nav mr-auto">
                        <a class="nav-link a-nav text-dark bg-white" href="{$path_chapitre13N}">Chapitre XIII</a>
<li class="nav-item">
                        <a class="nav-link a-nav text-dark bg-white" href="{$path_chapitre14N}">Chapitre XIV</a>
                    </li>
                    
                    <!-- menu déroulant pour les éditions facsimilaires  -->
                    <li class="nav-item">
                        <a class="nav-link dropdown-toggle navbar-brand text-dark" href="#" id="navbarDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Editions facsimilaires</a>
                        <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
                            <li class="dropdown-item text-dark bg-white">
                                <a href="{$path_facsimile13}">Chapitre 13</a>
                            </li>
                            <li class="dropdown-item text-dark bg-white">
                                <a href="{$path_facsimile14}">Chapitre 14</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <!-- menu déroulant pour les index  -->
                    <li class="nav-item">
                        <a class="nav-link dropdown-toggle navbar-brand text-dark" href="#" id="navbarDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Les index</a>
                        <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
                            <li class="dropdown-item text-dark bg-white">
                                <a href="{$path_indexpers}">Index des personnes</a>
                            </li>
                            <li class="dropdown-item text-dark bg-white">
                                <a href="{$path_indexplace}">Index des lieux</a>
                            </li>
                            
                        </ul>
                    </li>
                </ul>

            </nav>
            
            <!--Appel des éléments nécessaire pour le bon fonctionnement de la navbar-->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"/>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"/>
        </xsl:variable>
        
<!--        Variable permettant d'ajouter les métadonnées nécessaires à chaque page    -->
        <xsl:variable name="head">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="description" content="Edition numérique - {$title}"/>
            <meta name="author" content="{$title}"/>
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
                crossorigin="anonymous"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"/>
        </xsl:variable>


        <!-- Mise en place de la page d'accueil -->
        <xsl:result-document href="{$path_homepage}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container" style="text-align:justify">
                        <h1 style="text-align:center"> <xsl:value-of select="concat(//editionStmt/respStmt/resp/text() , ' de ')"/><i><xsl:value-of select="$title"/></i></h1>
                        <p>
                           Cette édition concerne <xsl:value-of
                                select="count(//div1[@type = 'chapter'])"/> chapitres de La
                            Daniella.
                        </p>
                        <p>
                            Ce projet a été réalisé pour le cours de XSLT dispensé à l'École
                            nationale des chartes dans le cadre du master "Technologies numériques
                            appliquées à l'Histoire". L'encodage de la source est lui le résultat du
                            cours de XML-TEI.
                           
                        </p>
                        <p>
                            <i>La Daniella</i> est un roman feuilleton écrit par <xsl:value-of select="$author"/> qui paraît dans la presse entre le 6 janvier et le 25 mars 1857. 
                            Le roman se présente comme une correspondance que le peintre Jean Valreg voyageant en Italie fait parvenir à son maître parisien.  
                        </p>
                        
                        <p>L'encodage s'est porté sur les chapitres XIII et XIV, parus respectivement les 21 et 22 janvier 1857 dans la Presse.</p>
                        
                    </div>
                    <!--<a href="Images/La_Presse_21.01_1.JPEG"/>-->
                    <div class="container" style="text-align:justify">
                        <p>
                            L'objectif poursuivi par ce projet est de proposer une transcription du
                            récit original mais aussi de mettre en exergue les prises de paroles des personnages.
                            A ce titre, un index de spécifique aux personnes est proposé. Celui-ci différencie l'origine 
                            des personnes selon qu'elles soient issues spécifiquement de <i><xsl:value-of select="$title"/></i>, des personnages fictionnels inspirés d'autres œuvres ou bien des personnes réelles et indiquant la manière dont ils sont appelés dans le récit. 
                        </p>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>


<!--Mise en place de la page HTML consacrée aux index de personnes différenciés-->
        <xsl:result-document href="{$path_indexpers}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Index')"/>
                    </title>
                </head>
                <body>
<!--   Répartition des mentions de personnes en quatre colonnes -->
                    <style>
                        #col {
                        column-count: 4;
                        }
                    </style>
                    
                    
                    <xsl:copy-of select="$navbar"/>
                        
                    <h1 class="text-center" style="color:rgb(156,17,17)">Index des personnes mentionnées dans le texte</h1>
                <!--Mise en place des onglets pour différencier les index-->
                    <div class="container">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="real-tab" data-toggle="tab"
                                    href="#real" role="tab" aria-controls="home"
                                    aria-selected="true">Personnes réelles</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="fict-tab" data-toggle="tab" href="#fict"
                                    role="tab" aria-controls="profile" aria-selected="false"
                                    >Personnages propres à <i>La Daniella</i></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="myth-tab" data-toggle="tab" href="#myth"
                                    role="tab" aria-controls="contact" aria-selected="false">Personnages irréels issus d'autres récits</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="real" role="tabpanel"
                                aria-labelledby="real-tab">
                                <div class="col-md-10 col-md-offset-2">
                                    <xsl:call-template name="persreelles"/>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="fict" role="tabpanel"
                                aria-labelledby="fict-tab">
                                <div class="col-md-10 col-md-offset-2">
                                    <xsl:call-template name="persdaniella"/>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="myth" role="tabpanel"
                                aria-labelledby="myth-tab">
                                <xsl:call-template name="persmytho"/>
                            </div>
                        </div>
                    </div>
                    <br/>

                </body>
                  
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
       <!-- Mise en place de la page html pour l'index de lieux-->
        <xsl:result-document href="{$path_indexplace}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"></xsl:copy-of>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Index de lieux')"/>
                    </title>
                </head>
                <body>
                    <style>
                        #col {
                        column-count: 2;
                        }
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div>
                        <h1 class="text-center" style="color:rgb(156,17,17)">Index de lieux</h1>
                        <xsl:call-template name="indexlieux"/>
                    </div>
                    <br/>
                    
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!--Mise en place de la page d'édition du chapitre 13  -->   
        <xsl:result-document href="{$path_chapitre13N}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', $chap13_title)"/>
                    </title>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    
                    
                    <div class="container">
                        <h1 style="text-align:center">Transcription du texte</h1>
                        <h2 style="text-align:center">
                            <xsl:value-of select="$chap13_title"/>
                        </h2>
                        
                        <xsl:call-template name="indics_chap13"/>
                        
                        <br/>
                        
                        <xsl:apply-templates select="//div1[@facs='#Daniella21.01']//p" mode="edit-version"/>
                        
                        <xsl:apply-templates select="//div1[@facs='#Daniella21.01']//signed" mode="edit-version"/>
                        
                        
                        
                        <br/>
                        <div style="text-align: center"><button style="center" onclick="window.location.href='{$path_el13}';"> Mise en exergue des prises de paroles </button></div>
                        <br/>
                    </div>
                    
                    <br/>
                    <br/>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!--Mise en place de la page d'édition du chapitre 14 -->   
        <xsl:result-document href="{$path_chapitre14N}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', $chap14_title)"/>
                    </title>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <h1 style="text-align:center">Transcription du texte</h1>
                        <h2 style="text-align:center">
                            <xsl:value-of select="$chap14_title"/>
                        </h2>
                        <xsl:call-template name="indics_chap14"/>
                       
                       <br/>
                        
                        <xsl:apply-templates select="//div1[@facs='#Daniella22.01']//p" mode="edit-version"/>
                        
                        <xsl:apply-templates select="//div1[@facs='#Daniella22.01']//signed" mode="edit-version"/>
                        
                        <br/>
                        <div style="text-align: center"><button style="center" onclick="window.location.href='{$path_el14}';"> Mise en exergue des prises de paroles </button></div>
                        <br/>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        

        
        <!-- Mise en place de la page HTML consacrée à la mise en avant de différents éléments dans chapitre 13 -->
        <xsl:result-document href="{$path_el13}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Etude personnages')"/>
                    </title>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <h2 style="text-align:center">
                            <xsl:value-of select="$chap13_title"/>
                        </h2>
                        <xsl:call-template name="explications_elmt"/>
                        <p style="text-align: left; font-style:italic;">
                            <xsl:text>Publié le </xsl:text>
                            <xsl:value-of select="//monogr[@xml:id='Daniella21.01']/imprint/date/text()"/>
                        </p>
                            <xsl:apply-templates select="//text" mode="etudeperso"/>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!-- Mise en place de la page HTML consacrée à la mise en avant de différents éléments dans chapitre 13 -->
        <xsl:result-document href="{$path_el14}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Etude personnages')"/>
                    </title>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    
                    <div class="container">
                        <h2 style="text-align:center">
                            <xsl:value-of select="$chap14_title"/>
                        </h2>
                        <xsl:call-template name="explications_elmt"/>
                        <p style="text-align: left; font-style:italic;">
                            <xsl:text>Publié le </xsl:text>
                            <xsl:value-of select="//monogr[@xml:id='Daniella22.01']/imprint/date/text()"/>
                        </p>
                        <xsl:apply-templates select="//text" mode="etudeperso"/>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!-- Mise en place de la page HTML consacrée à une édition fidèle au texte original-->
        <xsl:result-document href="{$path_facsimile13}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Facsimile chapitre 13')"/>
                    </title>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"></xsl:copy-of>
                    <div style="text-align:center">
                        <xsl:apply-templates select="//div1[@n='1']" mode="facsimile"/>
                    </div>
                    <hr/>
                    <xsl:call-template name="notes13"/>
                    <br/>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!-- Mise en place de la page HTML consacrée à une édition fidèle au texte original-->
        <xsl:result-document href="{$path_facsimile14}" method="html" indent="yes">
            <html>
                <head>
                    <xsl:copy-of select="$head"/>
                    <title>
                        <xsl:value-of select="concat($title, ' | ', 'Facsimile chapitre 14')"/>
                    </title>
                </head>
                <body>
                    <xsl:copy-of select="$navbar"></xsl:copy-of>
                    
                    <div style="text-align:center">
                        <xsl:apply-templates select="//div1[@n='2']" mode="facsimile"/>
                    </div>
                    <hr/>
                    <xsl:call-template name="notes14"/>
                    <br/>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Mise en place des templates appelés pour l'index de personnes -->
<!--    Concernant les personnes réelles-->
    <xsl:template name="persreelles">
        <h2 class="text-center" style="color:rgb(96,76,76);">Personnes réelles</h2>
        <xsl:for-each select="//listPerson[@type = 'real']/person/persName">
            <xsl:sort select="." order="ascending"/>
            
            <xsl:variable name="IDName">
                <xsl:value-of select="ancestor::person/@xml:id"/>
            </xsl:variable> 
            
            <xsl:variable name="nb-occurrence-dir">
                <xsl:value-of select="count(ancestor::TEI//body//persName[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <xsl:variable name="nb-occurrence-indir">
                <xsl:value-of select="count(ancestor::TEI//body//rs[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <div>
                <p>
<!--                    Pour afficher le nom de la personne-->
                    <b>
                        <xsl:value-of select="."/>
                    </b>
                </p>
                <p style="font-size:14px">
                    <i><xsl:value-of select="following-sibling::note//text()"/></i>
                </p>
                <p id="col">
<!--                    Pour afficher la page à laquelle la personne est évoquée puis une citation indiquant la manière dont ces dernières sont évoquées -->
                    <xsl:for-each select="ancestor::TEI//text//persName[replace(@ref, '#', '') = $IDName] | ancestor::TEI//text//rs[replace(@ref, '#', '') = $IDName]">
                        <xsl:text>page </xsl:text>
                        <xsl:value-of select="count(preceding::pb/@n)"/> 
                        <xsl:text>: «</xsl:text>
                        <xsl:value-of select=".//text()"/>
                        <xsl:text> »</xsl:text>
                        <xsl:choose>
                            <xsl:when test="position() != last()">, </xsl:when>
                            <xsl:otherwise>.</xsl:otherwise>
                        </xsl:choose> 
                        <br/>
                    </xsl:for-each>
                </p>
                <p style="font-size:14px">
<!--                    Pour afficher le nombre d'occurence de la personnes dans l'entièreté de l'œuvre-->
                    
                   <xsl:text> Soit : </xsl:text>
<!--                    Gestion de l'affichage des occurences directes-->
                    <xsl:choose>
                        <xsl:when test="$nb-occurrence-dir > 1">
                            <xsl:value-of select="$nb-occurrence-dir"/>
                            <xsl:text> occurences directes</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$nb-occurrence-dir = 0">
                                    <xsl:text>aucune occurence directe</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$nb-occurrence-dir"/>
                                    <xsl:text> occurence directe</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:text> et </xsl:text>
                   <!-- Gestion de l'affichage des occurences directes-->
                    <xsl:choose>
                        <xsl:when test="$nb-occurrence-indir > 1">
                            <xsl:value-of select="$nb-occurrence-indir"/>
                            <xsl:text> occurences indirectes</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$nb-occurrence-indir = 0">
                                    <xsl:text>aucune occurence indirecte</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$nb-occurrence-indir"/>
                                    <xsl:text> occurence indirecte</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    
                </p>
            </div>
            <hr/>
        </xsl:for-each>  
    </xsl:template>
    
    <!--    Concernant les personnages mythologique ou issus d'autres récits-->
    <xsl:template name="persmytho">
        <h2>Figures mythologiques ou issues d'autres récits</h2>
        <xsl:for-each select="//listPerson[@type = 'mythic']/person/persName">
            <xsl:sort select="." order="ascending"/>
            
            <xsl:variable name="IDName">
                <xsl:value-of select="ancestor::person/@xml:id"/>
            </xsl:variable> 
            
            <xsl:variable name="nb-occurrence-dir">
                <xsl:value-of select="count(ancestor::TEI//body//persName[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <xsl:variable name="nb-occurrence-indir">
                <xsl:value-of select="count(ancestor::TEI//body//rs[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <div>
                <p>
                    <b>
                        <xsl:value-of select="."/>
                    </b>
                </p>
                <p style="font-size:14px">
                    <i><xsl:value-of select="following-sibling::note//text()"/></i>
                </p>
                <p id="col">
                    <xsl:for-each select="ancestor::TEI//text//persName[replace(@ref, '#', '') = $IDName] | ancestor::TEI//text//rs[replace(@ref, '#', '') = $IDName]">
                        <xsl:text>page </xsl:text>
                        <xsl:value-of select="count(preceding::pb/@n)"/> 
                        <xsl:text>: «</xsl:text>
                        <xsl:value-of select=".//text()"/>
                        <xsl:text> »</xsl:text>
                        <xsl:choose>
                            <xsl:when test="position() != last()">, </xsl:when>
                            <xsl:otherwise>.</xsl:otherwise>
                        </xsl:choose> 
                        <br/>
                    </xsl:for-each>
                </p>
                <p style="font-size:14px">
                    
                    <xsl:text> Soit : </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$nb-occurrence-dir > 1">
                            <xsl:value-of select="$nb-occurrence-dir"/>
                            <xsl:text> occurences directes</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$nb-occurrence-dir = 0">
                                    <xsl:text>aucune occurence directe</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$nb-occurrence-dir"/>
                                    <xsl:text> occurence directe</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:text> et </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$nb-occurrence-indir > 1">
                            <xsl:value-of select="$nb-occurrence-indir"/>
                            <xsl:text> occurences indirectes</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$nb-occurrence-indir = 0">
                                    <xsl:text>aucune occurence indirecte</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$nb-occurrence-indir"/>
                                    <xsl:text> occurence indirecte</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </p>
            </div>
            <hr/>
        </xsl:for-each>   
    </xsl:template>
    
    <!--    Concernant les personnages propres à La Daniella-->
    <xsl:template name="persdaniella">
        <h2>Personnages propres à <i>La Daniella</i></h2>
        <xsl:for-each select="//listPerson[@type = 'fictional']/person/persName">
            <xsl:sort select="." order="ascending"/>
            
            <xsl:variable name="IDName">
                <xsl:value-of select="ancestor::person/@xml:id"/>
            </xsl:variable> 
            
            <xsl:variable name="nb-occurrence-dir">
                <xsl:value-of select="count(ancestor::TEI//body//persName[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <xsl:variable name="nb-occurrence-indir">
                <xsl:value-of select="count(ancestor::TEI//body//rs[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <div>
                <p>
                    <b>
                        <xsl:value-of select="."/>
                    </b>
                </p>
                <p style="font-size:14px">
                    <i><xsl:value-of select="following-sibling::note//text()"/></i>
                </p>
                <p id="col">
                    <xsl:for-each select="ancestor::TEI//text//persName[replace(@ref, '#', '') = $IDName] | ancestor::TEI//text//rs[replace(@ref, '#', '') = $IDName]">
                        <xsl:text>page </xsl:text>
                        <xsl:value-of select="count(preceding::pb/@n)"/> 
                        <xsl:text>: «</xsl:text>
                        <xsl:value-of select=".//text()"/>
                        <xsl:text> »</xsl:text>
                        <xsl:choose>
                            <xsl:when test="position() != last()">, </xsl:when>
                            <xsl:otherwise>.</xsl:otherwise>
                        </xsl:choose> 
                        <br/>
                    </xsl:for-each>
                </p>
                <p style="font-size:14px">
                    
                    <xsl:text> Soit : </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$nb-occurrence-dir > 1">
                            <xsl:value-of select="$nb-occurrence-dir"/>
                            <xsl:text> occurences directes</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$nb-occurrence-dir = 0">
                                    <xsl:text>aucune occurence directe</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$nb-occurrence-dir"/>
                                    <xsl:text> occurence directe</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:text> et </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$nb-occurrence-indir > 1">
                            <xsl:value-of select="$nb-occurrence-indir"/>
                            <xsl:text> occurences indirectes</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="$nb-occurrence-indir = 0">
                                    <xsl:text>aucune occurence indirecte</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$nb-occurrence-indir"/>
                                    <xsl:text> occurence indirecte</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    
                </p>
            </div>
            <hr/>
        </xsl:for-each>   
    </xsl:template>
    
<!-- Pour l'index de lieux   -->
    <xsl:template name="indexlieux">
   <!--On attrape tout les noms de lieux dans le texte -->
        <xsl:for-each select="//listPlace/place/placeName">
            <xsl:sort select="." order="ascending"/>
<!--            Variable qui attrape les identifiants des noms de lieux-->
            <xsl:variable name="IDName">
                <xsl:value-of select="ancestor::place/@xml:id"/>
            </xsl:variable> 
<!--            variable qui compte le nombre d'apparition de chaque lieux-->
            <xsl:variable name="nb-occurrence">
                <xsl:value-of select="count(ancestor::TEI//body//placeName[replace(@ref, '#', '') = $IDName])"/>
            </xsl:variable>
            
            <!-- Affichage du nom du lieux -->
            <div class="container" style="text-align:justify">
                <p>
                    <b>
                        <xsl:value-of select="."/>
                    </b>
                </p>
<!--                Affichage des notes afin de présenter le lieu-->
                <p style="font-size:14px">
                    <i><xsl:value-of select="following-sibling::note//text()"/></i>
                </p>
                <p id="col">
<!--                    Affichage du numéro de page où le lieu est évoqué suivi d'une citation -->
                    <xsl:for-each select="ancestor::TEI//text/body//placeName[replace(@ref, '#', '') = $IDName]">
                        <xsl:text>page </xsl:text>
                        <xsl:value-of select="count(preceding::pb/@n)"/> 
                        <xsl:text>: «</xsl:text>
                        <xsl:value-of select=".//text()"/>
                        <xsl:text> »</xsl:text>
                        <xsl:choose>
                            <xsl:when test="position() != last()">, </xsl:when>
                            <xsl:otherwise>.</xsl:otherwise>
                        </xsl:choose> 
                        <br/>
                    </xsl:for-each>
                </p>
                <hr/>
            </div>
        </xsl:for-each>
    </xsl:template>
    
<!--    Templates pour les page html présentant davantage d'indication dans l'édition -->
    <xsl:template name="indics_chap13">
        <style>.center-div {
            margin-left: auto;
            margin-right: auto;
            width: 6em
            }</style>
        
        <xsl:variable name="lien13">
            <xsl:value-of select="//monogr[@xml:id='Daniella21.01']/idno/text()"/>
        </xsl:variable>
        <div class="center-div" style="width: 600px;  padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align: center;"> 
            <h5 style="font-size:12px">
                <xsl:value-of select="//monogr[@xml:id='Daniella21.01']/title/text()"/>
            </h5>
            
            <p style="font-size:12px"><b>Lien vers le document original</b> : <xsl:value-of select="concat('https://gallica.bnf.fr/', $lien13)"/></p>
            <p style="font-size:12px"><b>Directeurs de publication</b> : <xsl:value-of select="concat(//monogr[@xml:id='Daniella21.01']//respStmt/persName[1], ', ' , //monogr[@xml:id='Daniella21.01']//respStmt/persName[2])"/></p>
            <p style="font-size:12px">Imprimé à <xsl:value-of select="//monogr[@xml:id='Daniella21.01']//imprint/pubPlace/text()"/>, le <xsl:value-of select="//monogr[@xml:id='Daniella21.01']//imprint/date/text()"/></p>
        </div>
    </xsl:template>
    
    <xsl:template name="indics_chap14">
        <style>.center-div {
            margin-left: auto;
            margin-right: auto;
            width: 6em
            }</style>
        
        <xsl:variable name="lien14">
            <xsl:value-of select="//monogr[@xml:id='Daniella22.01']/idno/text()"/>
        </xsl:variable>

        <div class="center-div" style="width: 600px;  padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align: center;"> 
            <h5 style="font-size:12px">
                <xsl:value-of select="//monogr[@xml:id='Daniella22.01']/title/text()"/>
            </h5>
            
            <p style="font-size:12px"><b>Lien vers le document original</b> : <xsl:value-of select="concat('https://gallica.bnf.fr/', $lien14)"/></p>
            <p style="font-size:12px"><b>Directeurs de publication</b> : <xsl:value-of select="concat(//monogr[@xml:id='Daniella22.01']//respStmt/persName[1], ', ' , //monogr[@xml:id='Daniella22.01']//respStmt/persName[2])"/></p>
            <p style="font-size:12px">Imprimé à <xsl:value-of select="//monogr[@xml:id='Daniella22.01']//imprint/pubPlace/text()"/>, le <xsl:value-of select="//monogr[@xml:id='Daniella22.01']//imprint/date/text()"/></p>
        </div>
    </xsl:template>
    
   
    
    
    <!-- Pour afficher le texte des chapitres -->
    <xsl:template match="TEI//body//div1/p" mode="edit-version">
        <p class="paragraph" align="justify">
            <xsl:apply-templates mode="edit-version"/>
        </p>
    </xsl:template>

    <!-- Pour ne pas afficher les mentions légales au milieu du texte -->
    <xsl:template match="TEI//body//div1//p//floatingText/body/p" mode="edit-version"/>
    
    <!-- Gestion des signatures en fin de chapitre -->
    <xsl:template match="TEI//body//div1//signed/lb" mode="edit-version">
            <p class="paragraph">
            <xsl:apply-templates mode="edit-version"/>
            </p>
    </xsl:template>

    <!-- Gestion des prise de paroles -->
    <xsl:template match="TEI/text/body//div1//p//said[@aloud='true']" mode="edit-version">        
                <said class="paragraph" align="justify">
                    <xsl:apply-templates mode="edit-version"/>
                </said>
    </xsl:template>
    
    <!-- Gestion des termes en langue étrangère -->
    <xsl:template match="TEI/text/body//div1//p//foreign" mode="edit-version">
            <i><xsl:apply-templates mode="edit-version"/></i>
    </xsl:template>
    


    
<!--    Pour afficher le texte original des chapitres-->
    <xsl:template match="TEI//body//div1/p" mode="etudeperso">
        <p class="paragraph">
            <xsl:apply-templates mode="etudeperso"/>
        </p>
    </xsl:template>
<!--    Les mentions indirectes aux personnes sont mises en rouge -->
    <xsl:template match="TEI//body//div1/p//rs" mode="etudeperso">
        <b>
            <FONT color="red"><xsl:apply-templates mode="etudeperso"/></FONT>
        </b>
        
    </xsl:template>
    
<!--    Les mentions directes aux personnages sont mises en bleu-->
    <xsl:template match="TEI//body//div1/p//persName" mode="etudeperso">
        <b>
            <FONT color="blue"><xsl:apply-templates mode="etudeperso"/></FONT>
        </b>
        
    </xsl:template>
<!--   Les mentions de lieux sont mises en vert-->
    <xsl:template match="TEI//body//div1/p//placeName" mode="etudeperso">
        <b>
            <FONT color="green"><xsl:apply-templates mode="etudeperso"/></FONT>
        </b>
    </xsl:template>
    
    <xsl:template match="TEI//body//div1/p//said" mode="etudeperso">
        <b>
            <xsl:apply-templates mode="etudeperso"/>
        </b>
    </xsl:template>
    
<!--    Mise en place du cadre d'explications -->
    <xsl:template name="explications_elmt">
        <style>.center-div {
            margin-left: auto;
            margin-right: auto;
            width: 6em
            }</style>
        <div class="center-div" style="width: 600px;  padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align: center;"> 
            <h5>Légende :</h5>
            <p>La couleur verte indique la mention de lieux.</p>
            <p>La couleur bleue indique la mention de personnes évoquées de manière directe.</p>
            <p>La couleur rouge indique la mention de personnes évoquées de manière indirecte.</p>
        </div>
    </xsl:template>    

<!--Placement des paragraphes dans une balise p-->
    <xsl:template match="TEI//body//div1//p" mode="facsimile">
            <p>
                <xsl:apply-templates mode="facsimile"/>
            </p>
    </xsl:template>
<!--    Rétablissement des sauts de lignes en prenant en compte les mots scindés-->
    <xsl:template match="TEI//body//div1//p//lb" mode="facsimile">
        <xsl:choose>
            <xsl:when test="./@rend='hyphen'">
                <xsl:text>-</xsl:text>
                <xsl:apply-templates mode="facsimile"/>
                <br/>  
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates mode="facsimile"/>
                <br/>    
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!--    Placement des prises de parole dans des balises said -->
    <xsl:template match="TEI//body//div1//said" mode="facsimile">
        <said>
            <xsl:apply-templates mode="facsimile"/>
        </said>
    </xsl:template>
    
<!--    Mise en italique des éléments de langue étrangère -->
    <xsl:template match="TEI//body//div1//foreign" mode="facsimile">
        <i>
            <xsl:apply-templates mode="facsimile"/>
        </i>
    </xsl:template>
    
<!--  Ajout du numéro de note en exposant  -->
    <xsl:template match="TEI//body//div1//p/note" mode="facsimile">
        <sup>
            <xsl:value-of select="./@n"/>
        </sup>
    </xsl:template>
    
<!--  Mise en gras des éléments des éléments introductifs du chapitre -->
    <xsl:template match="TEI//body//div1/cb/head" mode="facsimile">
        <div style="width: 600px;  padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align: left;">
            <b>
                <xsl:apply-templates mode="facsimile"/>
            </b>
        </div>
    </xsl:template>
   
<!--  Gestion des paragraphes en marge du chapitre -->
    <xsl:template match="//floatingText" mode="facsimile">
        <style>.center-div {
            margin-left: auto;
            margin-right: auto;
            width: 6em
            }</style>
        <div class="center-div" style="width: 600px;  padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align: center;">
            <xsl:apply-templates mode="facsimile"/>
        </div>
    </xsl:template>
    
<!--  Gestion de l'affichage des notes pour le chapitre 13  -->
    <xsl:template name="notes13">
        <div style="text-align:center">
            <xsl:for-each select="//div1[@n='1']//p//note">
                <xsl:variable name="note_txt" select="./text()"/>
                <p><xsl:value-of select="./@n"/>
                    <xsl:text> : </xsl:text>
                    <xsl:value-of select="$note_txt"/></p>
            </xsl:for-each>
        </div>
    </xsl:template>
    
<!--  Gestion de l'affichage des notes pour le chapitre 14  -->
    <xsl:template name="notes14">
        <div style="text-align:center">
            <xsl:for-each select="//div1[@n='2']//p//note">
                <xsl:variable name="note_txt" select="./text()"/>
                <p><xsl:value-of select="./@n"/>
                    <xsl:text> : </xsl:text>
                    <xsl:value-of select="$note_txt"/></p>
            </xsl:for-each>
        </div>
    </xsl:template>

<!--Affichage des changements de page et du numéro correspondant-->
    <xsl:template match="TEI//pb" mode="facsimile">
        <div>
            <p><b>Page <xsl:value-of select="./@n"/></b></p>
            <xsl:apply-templates mode="facsimile"/>
        </div>
    </xsl:template>

</xsl:stylesheet>
