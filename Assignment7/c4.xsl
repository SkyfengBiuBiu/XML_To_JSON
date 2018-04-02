<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />
	<xsl:variable name="remote"
		select="document('http://www.cc.puv.fi/~e1701269/collection.xml')" />
	<xsl:template match="/">
	{
		"Information of videos if the publication year is less than 2000, reduction 
		will be 50%, if the publication year is greater than 2000 and less than 2005, 
		the reduction will be 30%, if the the publication year is greater than 2005 
		and less than 2015, the reduction will be 15%":{
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
			{
			"title":"<xsl:value-of select="title" />",
			"year":"<xsl:value-of select="year" />",
		<xsl:choose>
			<xsl:when test="year &lt; 2000">
				<xsl:call-template name="calculate_discount1">
					<xsl:with-param name="price" select="price" />
					<xsl:with-param name="saving" select="price/@discount" />
				</xsl:call-template>
			</xsl:when>

			<xsl:when test="price &gt; 2000 and price &lt; 2005">
				<xsl:call-template name="calculate_discount2">
					<xsl:with-param name="price" select="price" />
					<xsl:with-param name="saving" select="price/@discount" />
				</xsl:call-template>
			</xsl:when>

			<xsl:otherwise>
				<xsl:call-template name="calculate_discount3">
					<xsl:with-param name="price" select="price" />
					<xsl:with-param name="saving" select="price/@discount" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="video">
			{
			"title":"<xsl:value-of select="title" />",
			"year":"<xsl:value-of select="year" />",
		<xsl:choose>
			<xsl:when test="year &lt; 2000">
				<xsl:call-template name="calculate_discount1">
					<xsl:with-param name="price" select="price" />
					<xsl:with-param name="saving" select="price/@discount" />
				</xsl:call-template>
			</xsl:when>

			<xsl:when test="price &gt; 2000 and price &lt; 2005">
				<xsl:call-template name="calculate_discount2">
					<xsl:with-param name="price" select="price" />
					<xsl:with-param name="saving" select="price/@discount" />
				</xsl:call-template>
			</xsl:when>

			<xsl:otherwise>
				<xsl:call-template name="calculate_discount3">
					<xsl:with-param name="price" select="price" />
					<xsl:with-param name="saving" select="price/@discount" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template name="calculate_discount1">
		<xsl:param name="price" />
		<xsl:param name="saving" />
			"price":"<xsl:value-of select="format-number(0.5*$price, '#.##')" />",
			"saving":"<xsl:value-of select="format-number(0.5*$price, '#.##')" />"
			}
			<xsl:if test="following-sibling::*">,</xsl:if>
	</xsl:template>

	<xsl:template name="calculate_discount2">
		<xsl:param name="price" />
		<xsl:param name="saving" />
			"price":"<xsl:value-of select="format-number(0.3*$price, '#.##')" />",
			"saving":"<xsl:value-of select="format-number(0.7*$price, '#.##')" />"
			}
			<xsl:if test="following-sibling::*">,</xsl:if>
	</xsl:template>

	<xsl:template name="calculate_discount3">
		<xsl:param name="price" />
		<xsl:param name="saving" />
			"price":"<xsl:value-of select="format-number(0.15*$price, '#.##')" />",
			"saving":"<xsl:value-of select="format-number(0.85*$price, '#.##')" />"
			}
			<xsl:if test="following-sibling::*">,</xsl:if>
	</xsl:template>

</xsl:stylesheet>