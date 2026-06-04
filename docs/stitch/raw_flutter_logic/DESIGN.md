---
name: Raw Flutter Logic
colors:
  surface: '#fff8f3'
  surface-dim: '#e7d8c2'
  surface-bright: '#fff8f3'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#fff2e1'
  surface-container: '#fcecd5'
  surface-container-high: '#f6e6d0'
  surface-container-highest: '#f0e0ca'
  on-surface: '#221a0d'
  on-surface-variant: '#58413f'
  inverse-surface: '#382f20'
  inverse-on-surface: '#ffeed8'
  outline: '#8c716e'
  outline-variant: '#e0bfbc'
  surface-tint: '#ac3230'
  primary: '#a92f2e'
  on-primary: '#ffffff'
  primary-container: '#ca4743'
  on-primary-container: '#fffbff'
  inverse-primary: '#ffb3ad'
  secondary: '#586400'
  on-secondary: '#ffffff'
  secondary-container: '#d9ed62'
  on-secondary-container: '#5e6b00'
  tertiary: '#7d4e63'
  on-tertiary: '#ffffff'
  tertiary-container: '#98667c'
  on-tertiary-container: '#fffbff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdad7'
  primary-fixed-dim: '#ffb3ad'
  on-primary-fixed: '#410004'
  on-primary-fixed-variant: '#8b181b'
  secondary-fixed: '#d9ed62'
  secondary-fixed-dim: '#bed049'
  on-secondary-fixed: '#191e00'
  on-secondary-fixed-variant: '#424b00'
  tertiary-fixed: '#ffd8e7'
  tertiary-fixed-dim: '#f2b6cf'
  on-tertiary-fixed: '#330e22'
  on-tertiary-fixed-variant: '#65394e'
  background: '#fff8f3'
  on-background: '#221a0d'
  surface-variant: '#f0e0ca'
typography:
  display-lg:
    fontFamily: Bricolage Grotesque
    fontSize: 120px
    fontWeight: '800'
    lineHeight: 110px
    letterSpacing: -0.04em
  display-lg-mobile:
    fontFamily: Bricolage Grotesque
    fontSize: 64px
    fontWeight: '800'
    lineHeight: 60px
    letterSpacing: -0.02em
  headline-xl:
    fontFamily: Bricolage Grotesque
    fontSize: 72px
    fontWeight: '800'
    lineHeight: 80px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Bricolage Grotesque
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
  body-lg:
    fontFamily: Hanken Grotesk
    fontSize: 20px
    fontWeight: '400'
    lineHeight: 32px
  body-md:
    fontFamily: Hanken Grotesk
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-mono:
    fontFamily: JetBrains Mono
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
  nav-link:
    fontFamily: Hanken Grotesk
    fontSize: 18px
    fontWeight: '700'
    lineHeight: 24px
spacing:
  base: 8px
  section-gap: 128px
  section-gap-mobile: 64px
  block-padding: 32px
  gutter: 24px
  container-max: 1440px
---

## Brand & Style

This design system is built for a Flutter developer who treats code as craft and UI as a structural statement. The brand personality is unapologetic, technical, and high-impact. It draws heavily from **Neo-Brutalism**, discarding the fluff of soft shadows and gradients in favor of raw structural integrity and intentional friction.

The target audience consists of tech recruiters, startup founders, and fellow engineers who value clarity and a strong point of view. The UI should evoke a sense of digital confidence, utilizing a "what you see is what you get" philosophy. Every element is defined by hard edges, high-contrast boundaries, and a rejection of traditional "politeness" in digital interfaces.

## Colors

The palette uses high-saturation clashes to create visual energy. The interaction model relies on color-blocking rather than depth.

- **Primary (Coral):** Used for structural accents, heavy CTA backgrounds, and key decorative elements.
- **Accent (Lime Yellow):** Reserved for persistent navigation, "Available for Work" indicators, and interactive highlights.
- **Soft (Pink):** Used for secondary content blocks or to soften the harshness of the primary coral in data-heavy sections.
- **Neutral (Beige):** Acts as a grounding element for long-form text containers or section dividers to prevent visual fatigue.
- **Black (#111111):** The "ink" of the system. Used for all borders, shadows (when applicable as hard offsets), and primary text.
- **White (#FFFFFF):** The canvas. Used to provide "breathing room" between intense color blocks.

## Typography

The typographic hierarchy is the most aggressive part of the design system. Headlines are massive and tightly tracked to feel like physical blocks of text.

- **Headlines:** Use `Bricolage Grotesque` in Extra Bold/Black weights. For display text, use negative letter spacing to create a dense, "ink-heavy" look.
- **Body:** `Hanken Grotesk` provides a clean, neutral balance to the expressive headlines. It ensures readability for project descriptions and technical blogs.
- **Technical Labels:** `JetBrains Mono` is used for metadata (e.g., "Language: Dart", "Year: 2024") to nod to the developer's environment.
- **Mobile Scaling:** Headings must shrink significantly on mobile while maintaining their "heavy" visual weight.

## Layout & Spacing

The design system follows a **Fixed Grid** approach for desktop and a **Fluid Margin** approach for mobile. 

- **The Grid:** A 12-column grid with 24px gutters. Elements should almost always align to the grid edges. 
- **The "Sticker" Philosophy:** Components do not float; they are "slapped" onto the canvas. Use large padding (32px+) inside color blocks to emphasize the container's boundary.
- **Navigation:** The Lime Yellow navigation bar is a persistent, fixed element—either a sidebar on desktop or a bottom-docked bar on mobile—acting as a constant anchor.
- **Visual Rhythm:** Use massive vertical spacing (128px+) between major sections to allow the bold colors and typography to exist without clutter.

## Elevation & Depth

This system rejects Z-axis realism. There are no blurs, no soft shadows, and no light sources.

- **Hard Shadows:** Depth is indicated exclusively via **Hard Offsets**. A component may have a black background block shifted 4px or 8px down and to the right to create a "pop" effect.
- **Tonal Stacking:** Depth is created by layering high-contrast colors. A Coral block sits directly on the White background with a 2px black border.
- **Active States:** When a button is pressed, it should "sink" by removing the hard offset shadow, simulating a physical push.

## Shapes

The primary shape language is **Sharp (0px)**. All major containers, project cards, and sections must have 90-degree angles to maintain the brutalist aesthetic.

**Exceptions:**
- **Pill Chips:** Only chips and tags (e.g., tech stack labels) use a full pill-radius (100px). These must have a minimum 2px thick black border to prevent them from looking too "soft."
- **Interactive Elements:** Buttons remain strictly rectangular.

## Components

### Buttons
Primary buttons are rectangular with a 2px black border. They use the Primary Coral color with a 4px black hard-offset shadow. On hover, the shadow color changes to Lime Yellow. On click, the button shifts 4px down-right to cover the shadow.

### Chips & Tags
Technical tags (e.g., "Flutter", "Firebase") use the Pill-shape with a 2px black border. Backgrounds alternate between Soft Pink and Neutral Beige. Text is set in `label-mono`.

### Cards
Project cards are large White or Beige containers with a 2px black border. They do not have shadows unless they are interactive. Headers within cards should use `headline-lg`.

### Input Fields
Inputs are sharp-edged rectangles with a 2px black border. When focused, the border thickness increases to 4px and the background shifts to a very light tint of the Primary color.

### Persistent Navigation
The Lime Yellow nav-bar is the constant. It uses thick black dividers between links. Active links are underlined with a 4px black stroke.

### Lists
Lists use large, thick black bullets or numbers in `Bricolage Grotesque`. Each list item is separated by a 2px black horizontal rule.