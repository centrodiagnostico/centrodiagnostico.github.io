<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:search="http://panax.io/search"
xmlns:searchParams="http://panax.io/site/searchParams"
xmlns:xo="http://panax.io/xover"
exclude-result-prefixes="#default"
>
	<xsl:output method="xml"
	   omit-xml-declaration="yes"
	   indent="yes"/>

	<xsl:key name="search" match="estudios[string(@searchParams:search)!='']/item[contains(
			  translate(@n
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ ()-*/'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 ,translate(/*/@searchParams:search
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ ()-*/'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 )]" use="@xo:id"/>

	<xsl:key name="search" match="estudios[string(@searchParams:search)!='']/item[contains(
			  translate(@n
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 ,translate('rx'
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 )
			 and contains(
			  translate(/*/@searchParams:search
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 ,translate('rayos'
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 )
			 ]" use="@xo:id"/>

	<xsl:key name="search" match="estudios[string(@searchParams:search)!='']/item[contains(
			  translate(@n
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 ,translate('rayos'
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 )
			 and contains(
			  translate(/*/@searchParams:search
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 ,translate('rx'
			 ,'abcdefghijklmnopqrstuvwxyzáéíóúñABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÑ'
			 ,'ABCDEFGHIJKLMNOPQRSTUVWXISAEIOUNABCDEFGHIJKLMNOPQRSTUVWXISAEIOUN')
			 )
			 ]" use="@xo:id"/>

	<xsl:key name="search" match="estudios[string(@searchParams:search)='']/item[@c=../@search:categoria]" use="@xo:id"/>
	<xsl:key name="search" match="estudios[string(@searchParams:search)='' and string(@search:categoria)='']/item" use="@xo:id"/>

	<xsl:param name="searchParams:search"></xsl:param>
	<xsl:template match="text()"/>

	<xsl:template match="/">
		<section id="features" class="laboratory">
			<!--<style>
	<![CDATA[

.card {
	position: relative;
	width: 350px;
	height: 190px;
	background: #fff;
	border-radius: 20px;
	transition: 0.5s;
}

.card:hover {
	height: 450px;
}

.imgBx {
	position: absolute;
	left: 50%;
	top: -50px;
	width: 150px;
	height: 150px;
	background: #fff;
	border-radius: 20px;
	overflow: hidden;
	transition: 0.5s;
}

.card: hover .imgBx {
	width: 250px;
	height: 250px;
}

.imgBx img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit; cover;
}

.card .content {
	position: absolute;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: flex-end;
	overflow: hidden;
}

.card .content .details {
	padding: 40px;
	text-align: center;
	width: 100%;
	transition: 0.5s;
	transform: translateY(10px);
}

.card:hover .content .details {
	transform: translateY(0px);
}

.card .content .details h2 {
	font-size:1.25em;
	font-weight: 600:
	color: #555:
	line-height: 1.2em;
}

.card .content .details h2 span {
	font-size: 0.75em;
	font-weight: 500;
	opacity: 0.5;
}

.card .content .details .data {
	display: flex;
	justify-content: space-between;
	margin: 20px 0;
}

.card .content .details .data h3 {
	font-size: 1em;
	color: #555;
	line-height: 1.2em;
	font-weight: 600;
}

.card .content .details .data h3 span {
	font-size: 0.85em;
	font-weight: 400;
	opacity: 0.5;
}

.card .content .details .actionBtn {
	display: flex;
	justify-content: space-between;
}

.card .content .details .actionBtn button {
	padding: 10px 30px;
	border-radius: 5px;
	border: none;
	outline: none;
	font-size: 1em;
	font-weight: 500;
	background: #ff5f95;
	color: #fff;
	cursor: pointer;
}

.card .content .details .actionBtn button: nth-child(2) {
	border: 1px solid #999;
	color: #999;
	background; #fff;
}


			]]></style>-->
			<style>
				.card-body {
				flex: 1 1 auto;
				padding: .5rem .5rem;
				}
			</style>
			<div class="container aos-init aos-animate" data-aos="fade-up">
				<div class="row">
					<div class="col" data-aos="fade-right">
						<div class="mt-1">
							<h4>Estudios de laboratorio
						</h4>
							<p>El diagnóstico temprano aumenta la posibilidad de que el paciente viva con el virus de forma saludable por muchos años.</p>
						</div>
					</div>
					<!--<div class="image col-lg-6" style="background-image: url(img/laboratorio.jpg);" data-aos="zoom-in">

					</div>-->
				</div>
			</div>
			<section id="featured-services" class="product-item section" style="padding: 20px 0">
				<div class="container">
					<div class="row">
						<xsl:apply-templates/>
					</div>
				</div>
			</section>
		</section>
	</xsl:template>

	<xsl:template match="estudios/item"/>

	<xsl:template match="estudios/item[key('search',@xo:id)]">
		<xsl:variable name="original_price" select="@o"/>
		<xsl:variable name="final_price" select="@o * (1-@p)"/>
		<div class="col-sm-6 col-md-4 mb-5">
			<!--<div class="card">
				<div class="content">
					<div class="details">
						<h2>
							<xsl:apply-templates select="@n"/>
						</h2>
						<span class="value-price fw-bold">
							<xsl:value-of select="format-number($final_price,'$,###.00')"/>
						</span>
						<span>
							<xsl:if test="$original_price!=$final_price">
								<span class="value-price fw-bold">
									<del>
										<xsl:value-of select="format-number($original_price,'$,###.00')"/>
									</del>
								</span>
							</xsl:if>
						</span>
					</div>
				</div>
			</div>-->
			<div class="card card-box">
				<div class="card-header" style="min-height: 56px;">
					<p class="card-text">
						<div style="display: flex!important;">
							<span style="display: inline-flex; right: 0">
								<xsl:value-of select="@c"/>
							</span>
							<xsl:if test="$original_price!=$final_price">
								<h4 style="display: inline-flex; margin-left: auto">
									<span class="badge bg-success rounded-pill">
										<xsl:value-of select="format-number(-@p,',###.##%')"/>
									</span>
								</h4>
							</xsl:if>
						</div>
					</p>
				</div>
				<div class="card-body">
					<div style="display: flex!important;">
						<h1 class="card-title">
							<xsl:apply-templates select="@n"/>
						</h1>
						<xsl:if test="$original_price!=$final_price">
							<del class="text-danger" style="display: inline-flex; margin-left: auto">
								<xsl:value-of select="format-number($original_price,'$,###.00')"/>
							</del>
						</xsl:if>
					</div>
				</div>
				<div class="price">
					<!--<xsl:if test="$original_price!=$final_price">
						<h1>
							<span class="badge bg-success rounded-pill">
								<xsl:value-of select="format-number(@p,',###.##%')"/>
							</span>
						</h1>
					</xsl:if>-->
					<span class="value-price fw-bold" style="margin-bottom: 1rem;">
						<xsl:value-of select="format-number($final_price,'$,###.00')"/>
					</span>
				</div>
				<div class="card-more" onclick="scope.set('{@xo:id}')" xo-slot="state:active">
					<a href="#mostrar_estudio" class="btn btn-primary w-75" style="border-radius: 12px;">Ver estudio</a>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
