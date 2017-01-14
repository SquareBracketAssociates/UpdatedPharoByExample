Pharo Logo SVG
==============

Nested composition
------------------

- Pharo_Logo contains Pharo_Icon which contains Pharo_Beacon (beacon is used as favicon for website)

<g id="logo">
	...
	<g id="icon">
		...
		<g id="beacon">
			...
		</g>
	</g>
</g>


Version
-------


2014-05-05 Pharo_Logo_v3.0.svg

- Download Pharo_Logo_v0.9.svg from http://files.pharo.org/media/logo/Pharo%20Logo%20SVG/
- Delete XML-elements
	- paths: "inner_Phar", "glare_Phar", "inner_o", "glare_o"
	- gradients: "lG_outer_Phar", "lG_inner_Phar", lG_outer_o", "lG_inner_o", "rG_glare_Pharo", "rG_background", "shadow"
- Delete XML-attributes
	- filter:url(#shadow)
- Change XML-attributes
	- fill:url(#lG_outer_Phar) --> fill:#3297D4
	- fill:url(#lG_outer_o) --> fill:#3297D4
	- fill:url(#rG_background) --> fill:#E5E5FF
- Move XML-element
	- "water-splashes" so that splashes are laying under Pharo's "o"


2013-04-29 Pharo_Logo_v0.9.svg

- Download pharo-logos.zip from http://www.pharo-project.org/pharo-download/media-files
- Import pharo-0.8.1.pdf into Inkscape (vector graphic program)
- Ungroup all SVG-elements + Recalculate relative to absolute coordinates (it's a little bit tricky in Inkscape)
- Split SVG-elements if necessary (Pharo letter glare effekt)
- (Re-)Group associated parts
- Replace all bitmap-parts with vector only equivalents, in particular shadow
- Reorganice references between shapes and color-gradients or filters, eleminate duplicates
- Shorten too long coordinate system numbers e.g. 25.772936550317932 --> 25.77 with https://petercollingridge.appspot.com/svg_optimiser
- Name SVG-elements with "speaking" names
- Export from Inkscape without Inkscape-specific XML-elements/attributes
- Finishing with common texteditor (UTF-8 capable)
--
- "water-splashes" and "flare" of the icon-part are coming out of the stylized "o" (it's a minimal intervention)
- for use as Pharo_Icon_v0.9.svg
	- set "background"'s fill-opacity:0 --> fill-opacity:1
	- set "flare"'s opacity:0.5 --> opacity:0.7 for better contrast


