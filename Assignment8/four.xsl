<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />

	<xsl:template match="/movie_shop">
		{
		"movies":{
		"movie":[
		<xsl:for-each select="//movie[@type='Thriller']">
			<xsl:if test="preceding-sibling::*">
				,
			</xsl:if>
			{
			"name":"
			<xsl:value-of select="./name" />
			",
			"id":"
			<xsl:value-of select="./@id" />
			",
			"price" : "
			<xsl:value-of select="./price" />
			",
			"release_year" : "
			<xsl:value-of select="./release_year" />
			"
			}
		</xsl:for-each>
		]
		}}
	</xsl:template>
</xsl:stylesheet>

