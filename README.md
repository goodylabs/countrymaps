# countrymaps

## How to generate PNG for one SVG pair (light and dark)

```
cd src && ./convert_svg_to_png.sh ./svg/light/nz-ac-light.svg ../png/nz-ac-light.png && ./convert_svg_to_png.sh ./svg/dark/nz-ac-dark.svg ../png/nz-ac-dark.png
```

## How to generate all PNGs for all SVG pairs

```
cd src && ./convert_all_from_svg_to_png.sh
```