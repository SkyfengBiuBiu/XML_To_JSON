<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />

	<xsl:template match="movies">

		<xsl:variable name="cheapest">
			<xsl:for-each select="movie">
				<xsl:sort select="price" />
				<xsl:if test="position() = 1">
					<xsl:value-of select="@id" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>


		<xsl:variable name="most_expensive">
			<xsl:for-each select="movie">
				<xsl:sort select="price" />
				<xsl:if test="position()=last()">
					<xsl:value-of select="@id" />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		{
		"movies":{
		"Cheapest_movie":
		<xsl:for-each select="movie[@id=$cheapest]">
			{
			"name":"
			<xsl:value-of select="name" />
			",
			"id":"
			<xsl:value-of select="@id" />
			",
			"type":"
			<xsl:value-of select="@type" />
			",
			"price":"
			<xsl:value-of select="price" />
			",
			"release_year":"
			<xsl:value-of select="release_year" />
			"
			}
		</xsl:for-each>
		},

		{
		"Most_expensive_movie":
		<xsl:for-each select="movie[@id=$most_expensive]">
			{
			"name":"
			<xsl:value-of select="name" />
			",
			"id":"
			<xsl:value-of select="@id" />
			",
			"type":"
			<xsl:value-of select="@type" />
			",
			"price":"
			<xsl:value-of select="price" />
			",
			"release_year":"
			<xsl:value-of select="release_year" />
			"
			}
		</xsl:for-each>
		}}
	</xsl:template>

	<xsl:template match="customers"></xsl:template>




</xsl:stylesheet>

