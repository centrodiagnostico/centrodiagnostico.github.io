﻿<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:searchParams="http://panax.io/site/searchParams"
xmlns:xo="http://panax.io/xover"
exclude-result-prefixes="#default"
>
	<xsl:output method="xml"
	   omit-xml-declaration="yes"
	   indent="yes"/>

	<xsl:key name="active" match="estudios/item[@xo:id=/*/@state:active]" use="'*'"/>

	<xsl:template match="text()"/>
	<xsl:param name="searchParams:search"></xsl:param>
	<xsl:template match="/*">
		<form class="d-flex" id="estudios_buscador" action="estudios.html?search={$searchParams:search}#estudios" target="_self" >
			<input class="form-control me-2" name="search" type="search" placeholder="Buscar estudio..." aria-label="Buscar..." oninput="xo.site.searchParams.set('search', this.value)" value="{$searchParams:search}"/>
			<button class="btn btn-primary d-flex" type="submit">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search mt-1" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
				</svg>
				<span class="ms-2">
					Buscar
				</span>
			</button>
		</form>
	</xsl:template>
</xsl:stylesheet>
