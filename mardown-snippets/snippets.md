## 1. Titles/headers
# for titles   `~,1!,2@,3#,4$,5%,6^,7&,8*,9(,0),-_,=+
## 2. Bold, italic, etc. (already available)
**bold text **
*italic text *
*** bold and italic text ***
~~strikethrough~~
`inline code`

## 3. Colors — this is the trick
Markdown has no native color syntax. GitHub READMEs get color by embedding raw HTML directly in the .md file (GitHub supports a safe subset of HTML in markdown):
<p style="color:blue">This text is blue</p>
<span style="color:#e63946">Custom hex color</span>

## 4. Badges (the shiny pill-shaped labels)
These come from shields.io — you generate a badge URL and drop it in as an image:
![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
You can customize color, logo, style (flat, flat-square, for-the-badge, etc.) just by editing the URL.

## 5. Centering / custom layout
GitHub markdown doesn't center text natively, but HTML works here too:
<div align="center">
  <h1>My Project</h1>
  <p>A short tagline</p>
</div>

## 6. Fancy fonts / banner images
Real "designed" text (gradient fonts, stylized titles) usually isn't text at all — it's an image (a banner/logo made in Canva/Figma) inserted like:
![banner](./assets/banner.png)
Some people also use readme-typing-svg or capsule-render banners for animated gradient title headers — you just paste a generated URL.

## 7. Icons
Simple Icons or shields.io logos, or emoji shortcodes like :rocket: → 🚀
