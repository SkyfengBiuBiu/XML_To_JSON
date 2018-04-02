<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:myData="http://videoshop.videos.com">
	<!--Here we define global variable thisDocument, which holds the content 
		of this document. -->
	<xsl:output method="text" />
	<xsl:variable name="thisDocument" select="document('')" />
	<!-- Here we put actual XML data -->
	<myData:videos>
		<video id="v10">
			<title>Scarry Movie</title>
			<artist>Johnny Unknown</artist>
			<country>Germany</country>
			<company>Thriller Movies GMBH</company>
			<price discount="8">23.90</price>
			<year>2010</year>
		</video>
		<video id="v20">
			<title>Apocalypto</title>
			<artist>Garcia</artist>
			<country>Mexico</country>
			<company>Latin America Features</company>
			<price discount="6">32.90</price>
			<year>2006</year>
		</video>
		<video id="v30">
			<title>Troy</title>
			<artist>Brad Pits</artist>
			<country>US</country>
			<company>Ancient Movies</company>
			<price discount="15">>25.90</price>
			<year>2000</year>
		</video>
		<video id="v40">
			<title>Psycho</title>
			<artist>Norman Bates</artist>
			<country>US</country>
			<company>Alfred Hichkcoks</company>
			<price discount="25">>40.90</price>
			<year>1976</year>
		</video>
	</myData:videos>

	<xsl:template match="/">
	{
		"Information of videos whose discount is less or equal to 10":{
		"video":[
		<xsl:apply-templates
		select="$thisDocument/xsl:stylesheet/myData:videos/video" />
		        ]
		}
	}
	</xsl:template>

	<xsl:template match="video">
		<xsl:if test="price/@discount &lt; 10 ">
		<xsl:if test="preceding-sibling::*">,</xsl:if>
			{
			"title":"<xsl:value-of select="title" />",
			"artist":"<xsl:value-of select="artist" />",
			"country":"<xsl:value-of select="country" />",
			"company":"<xsl:value-of select="company" />",
			"price":"<xsl:value-of select="price" />",
			"discount":"<xsl:value-of select="price/@discount" />%",
			"year":"<xsl:value-of select="year" />"
			}
			</xsl:if>
	</xsl:template>

</xsl:stylesheet>





















