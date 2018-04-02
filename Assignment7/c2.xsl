<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />
	<xsl:variable name="remote"
		select="document('http://www.cc.puv.fi/~e1701269/collection.xml')" />
	<xsl:template match="/">
{
	" Information of CDs and videos which has a price
	 either less than 15 or greater than 30 euros":{
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
	
	<xsl:template match="cd">
			<xsl:if test="preceding-sibling::*" >,</xsl:if>
		<xsl:if test="price &gt; 30 or price &lt; 15">
			{
			"title":"<xsl:value-of select="title" />",
			"artist":"<xsl:value-of select="artist" />",
			"company":"<xsl:value-of select="company" />",
			"country":"<xsl:value-of select="country" />",
			"price":"<xsl:value-of select="price" />",
			"discount":"<xsl:value-of select="price/@discount" />%",
			"year":"<xsl:value-of select="year" />"
			}
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="video">
	
		<xsl:if test="price &gt; 30 or price &lt; 15">
			{
			"title":"<xsl:value-of select="title" />",
			"artist":"<xsl:value-of select="artist" />",
			"company":"<xsl:value-of select="company" />",
			"country":"<xsl:value-of select="country" />",
			"price":"<xsl:value-of select="price" />",
			"discount":"<xsl:value-of select="price/@discount" />%",
			"year":"<xsl:value-of select="year" />"
			}
			<xsl:if test="following-sibling::*">,</xsl:if>
		</xsl:if>
		
	</xsl:template>
</xsl:stylesheet>