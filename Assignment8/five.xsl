<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/movie_shop">
		{
		<xsl:variable name="all_price"
			select="sum(movies/movie/price)" />
		<xsl:variable name="number" select="count(movies/movie)" />
		<xsl:variable name="result"
			select="$all_price div $number" />
		"Average_price" :"
		<xsl:value-of select="$result" />
		"
		}
	</xsl:template>

</xsl:stylesheet>

