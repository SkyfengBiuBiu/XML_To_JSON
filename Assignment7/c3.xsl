<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />
	<xsl:variable name="remote"
		select="document('http://www.cc.puv.fi/~e1701269/collection.xml')" />
	<xsl:template match="/">
	{
		"information of cds and videos so that they are sorted according to 
		the country in ascending order and according to the price in descending 
		order":{	
		"collection":[
		{
		 "CD":[
		<xsl:apply-templates select="$remote/collection/cds" />
		      ]
		 }
		 ,
		 {
		 "video":[
		<xsl:apply-templates select="$remote/collection/videos" />
		      ]
		}
	   ]
		}
	}			
	</xsl:template>
	
	<xsl:template match="cds">
		<xsl:for-each
			select="$remote/collection/cds/cd">
			<xsl:sort data-type="text" order="ascending" select="country" />
			<xsl:sort data-type="text" order="descending" select="price" />
				{
				"title":"<xsl:value-of select="title" />",
				"artist":"<xsl:value-of select="artist" />",
				"country":"<xsl:value-of select="country" />",
				"company":"<xsl:value-of select="company" />",
				"price":"<xsl:value-of select="price" />",
				"discount":"<xsl:value-of select="price/@discount" />%",
				"year":"<xsl:value-of select="year" />"
				}
				<xsl:if test="following-sibling::*">,</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="videos">
		<xsl:for-each
			select="$remote/collection/videos/video">
			<xsl:sort data-type="text" order="ascending" select="country" />
			<xsl:sort data-type="text" order="descending" select="price" />
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
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
