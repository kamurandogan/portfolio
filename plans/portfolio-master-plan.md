# Portfolio Sitesi Master Planı

## Context

Kamuran Doğan'ın kişisel developer portfolio sitesi. Amaç: iş başvurusu + freelance müşteri çekme.
Flutter Web ile geliştirilecek, GitHub Pages'te host edilecek. Türkçe + İngilizce dil desteği.

---

## Karar Verilen Özellikler

| Konu | Karar |
|------|-------|
| Framework | Flutter Web |
| Host | GitHub Pages |
| Tema | Bold & colorful — pixel.melbourne tarzı, renkli zemin, devasa tipografi |
| Dil | TR + EN (switcher) |
| Tasarım Stili | Cesur tipografi ekranı kaplar, renkli section zeminleri, slider projeler |
| Animasyon | Slider geçişleri, menu panel slide-in, hover renk değişimleri |
| Projeler | Broccolai, Wedlist — slider kart yapısı (gelecekte kolayca eklenebilir) |
| Kimlik | Flutter & AI Backend Developer |

---

## Bölümler

1. **Hero** — İsim, unvan ("Full-stack Flutter Developer"), kısa bio, CTA butonları (İletişim / Projeleri Gör)
2. **Projeler** — Broccolai kartı (ekran görüntüsü, açıklama, App Store/Google Play linki, tech stack etiketleri). Yeni proje kolayca eklenebilir yapıda.
3. **Yetenekler / Stack** — Flutter, Dart, Supabase, Firebase, Riverpod, GoRouter, RevenueCat, Figma vb. ikonlarla
4. **İletişim** — E-posta (`kamurandgn@gmail.com`), GitHub, LinkedIn linkleri + basit form (mailto veya formspree)

---

## Adımlar

### Adım 1: Google Stitch Prompt Yazımı
Aşağıdaki bölümü kullanarak Google Stitch'e detaylı prompt ver. Her section için ayrı frame tasarlatılabilir.

### Adım 2: Flutter Web Projesi Oluşturma
```bash
flutter create --platforms=web kamuran_dogan_portfolio
```

### Adım 3: Temel Yapı & Paketler

**pubspec.yaml eklenecek paketler:**
- `go_router` — sayfa yönlendirme
- `flutter_riverpod` — state (dil switcher için)
- `google_fonts` — tipografi
- `flutter_animate` — animasyonlar (scroll reveal, micro animations)
- `url_launcher` — dış linkler
- `flutter_svg` — ikonlar
- `visibility_detector` — scroll trigger animasyonlar için

**Proje klasör yapısı:**
```
lib/
  main.dart
  app.dart                  # GoRouter + theme setup
  core/
    theme/
      app_theme.dart        # Renk paleti, text styles
      app_colors.dart
    l10n/
      app_localizations.dart
      strings_tr.dart
      strings_en.dart
  features/
    hero/
      hero_section.dart
    projects/
      projects_section.dart
      project_card.dart
      models/project_model.dart
    skills/
      skills_section.dart
      skill_chip.dart
    contact/
      contact_section.dart
  shared/
    widgets/
      nav_bar.dart
      language_switcher.dart
      section_wrapper.dart   # scroll reveal wrapper
    constants/
      project_data.dart      # Broccolai ve diğer projeler statik data
```

### Adım 4: Tasarım Sistemi

**Renk Paleti (pixel.melbourne'den ilham):**
- Hero zemin: `#EC605A` (coral/salmon — ana güçlü renk)
- Accent / vurgu: `#E9FD70` (lime sarı — logo, butonlar, hover metin)
- Menu panel: `#F4B8D1` (pembe — sağdan açılan nav paneli)
- Menu aktif item: `#EC605A` (coral — aktif nav item arka planı)
- Projeler zemin: `#D4C5B0` (bej/taupe — pixel'deki gibi proje slider arka planı)
- Text üzerine coral: `#F4B8D1` (açık pembe — büyük hero metni)
- Text üzerine bej: `#111111` (siyah)
- Proje kartı üzeri: `#FFFFFF` (kart içi beyaz metin)

**Her projeye kendi kart rengi:**
- Broccolai: koyu fotoğraf/ekran görüntüsü kaplı kart
- Wedlist: koyu fotoğraf/ekran görüntüsü kaplı kart

**Tipografi:**
- Başlık: Space Grotesk ExtraBold veya Black — devasa, ekranı kaplayan
- Nav menu linkleri: aynı font, çok büyük (HOME / PROJECTS / CONTACT)
- Body / kart metni: Space Grotesk Regular veya Inter

**Layout & Yapı (pixel.melbourne pattern):**
- **Hero:** Tam ekran coral zemin. Devasa tipografi ortada/solda. Sağ üst: "Menu +"
- **Nav:** Standart navbar YOK — sadece sol üst logo "KD", sağ üst "Menu +" butonu
- **Menu:** Sağdan açılan tam boy panel (pembe zemin), büyük bold linkler, "Close ×"
- **Projeler:** Tam ekran bej zemin, merkezi büyük kart slider, yanlarda kısmen görünen kartlar, alt ok navigasyonu
- **Skills:** Renkli zemin (coral veya lime), chip grid
- **Contact:** Menu panel tarzı — büyük bold "LET'S TALK" + iletişim bilgileri

**Animasyonlar:**
- Menu panel: sağdan slide-in (AnimatedContainer veya flutter_animate)
- Proje slider: PageView ile smooth scroll, yan kartlar scale-down
- Hero metin: büyük fade-in + hafif slideUp
- Hover: nav linkleri renk değişimi, buton arka plan swap

### Adım 5: Google Stitch Prompts

#### 5a. Hero Section Prompt
```
Design a bold, colorful hero section for a Flutter developer portfolio website,
inspired by the style of pixel.melbourne.

Background: coral/salmon (#EC605A), full screen. No images, no illustrations.

Top-left corner: Logo "KD" in bold lime yellow (#E9FD70), large text.
Top-right corner: "Menu +" text button in lime yellow (#E9FD70). No traditional navbar.

Center: Massive bold grotesque typography in light pink (#F4B8D1),
spanning multiple lines across most of the screen width:
  "Flutter
   Developer."
Below in medium bold: tagline "Building apps that ship." in lime yellow (#E9FD70).
Bottom-left small text: "Kamuran Doğan — kamurandgn@gmail.com" in lime yellow.

Overall vibe: bold creative agency, maximum typographic impact.
Reference: pixel.melbourne hero — same energy, coral background, huge type, lime accents.
No whitespace wasted. No gradients, no glassmorphism.
```

#### 5b. Projects Slider Prompt
```
Design a projects showcase section inspired by pixel.melbourne's project slider.

Background: warm beige/taupe (#D4C5B0), full screen.

Layout: horizontal card slider.
- Center: one large featured project card (roughly 60% screen width), full bleed.
- Left and right: previous/next cards partially visible, slightly smaller.
- Bottom center: two pill-shaped arrow navigation buttons in lime yellow (#E9FD70).

Each project card:
- Full bleed dark background with app name in large white bold text centered on card.
- Bottom strip inside card: one-line description + App Store / Play Store icon badges.

Projects:
1. Broccolai — "AI Football Predictions" — dark forest green card (#1A2E1A)
2. Wedlist — "Wedding List Manager" — dark burgundy card (#2E1A1F)

Vibe: cinematic, editorial, confident. Like a film studio showreel carousel.
Reference: pixel.melbourne directors section.
```

#### 5c. Skills Section Prompt
```
Design a skills/tech stack section for a bold colorful developer portfolio.
Background: lime yellow (#E9FD70), full screen section.
Section title: "Tech Stack" in massive black bold grotesque typography, top-left aligned.

Below title: flowing wrap layout of skill tags.
Each tag: black background, white bold text, rounded pill shape, generous padding.
Skills: Flutter, Dart, Supabase, Firebase, Riverpod, GoRouter,
RevenueCat, NestJS, PostgreSQL, Docker, Figma, GitHub, Codemagic.

Hover: pill inverts to white background + black text.
No icons, pure typographic chips. Bold, playful, confident.
```

#### 5d. Contact Section Prompt
```
Design a contact section for a bold colorful developer portfolio.
Background: coral (#EC605A), full screen.

Large bold grotesque title top-left: "LET'S TALK." in light pink (#F4B8D1).
Below: subtitle "Open to full-time roles and freelance projects." in lime yellow (#E9FD70).

Contact details stacked below in white or lime:
  kamurandgn@gmail.com
  github.com/kamurandogan
  linkedin.com/in/kamurandogan

Bottom-right: large outlined pill button "Download CV" in lime yellow border + text.

Vibe: pixel.melbourne "Let's Talk" section. Bold, confident, no forms.
```

#### 5e. Slide-in Menu Panel Prompt
```
Design a full-height slide-in navigation panel inspired by pixel.melbourne.

Panel slides in from the right, covering ~40% of screen width.
Background: light pink (#F4B8D1).
Top-right: "Close ×" in large bold black text.

Large bold navigation links stacked vertically with generous spacing:
  HOME  ↗
  PROJECTS  ↗   ← this row has coral (#EC605A) background strip (active state)
  SKILLS  ↗
  LET'S TALK  ↗

Below links, smaller contact info in dark gray:
  kamurandgn@gmail.com
  github.com/kamurandogan
  linkedin.com/in/kamurandogan

Bottom: language switcher "TR | EN" in small bold text.

Reference: pixel.melbourne menu panel — exact same structure and feel.
```

#### 5f. Full Page Overview Prompt
```
Design a full single-page portfolio layout overview for a Flutter developer,
inspired by pixel.melbourne. Show all sections as a vertical scroll map.

Sections (each full viewport height):
1. Hero — coral (#EC605A) bg, massive light pink typography "Flutter Developer."
2. Projects — beige (#D4C5B0) bg, horizontal card slider, 2 dark app cards, lime arrow buttons.
3. Skills — lime yellow (#E9FD70) bg, huge black "Tech Stack" title + black pill chips.
4. Contact — coral (#EC605A) bg, huge pink "LET'S TALK." + lime contact info.

Persistent overlay: top bar with "KD" lime logo left, "Menu +" lime right — floats over all sections.
Slide-in menu: pink panel (#F4B8D1) from right with bold nav links.

Strict palette: #EC605A, #E9FD70, #F4B8D1, #D4C5B0, #111111, #FFFFFF.
No gradients, no glassmorphism. Pure bold color blocks + grotesque typography.
```

### Adım 6: GitHub Pages Deploy

**Repository:** `kamurandogan.github.io` veya `kamurandogan/portfolio`

```bash
# Web build
flutter build web --release --base-href "/"

# Deploy
# Seçenek A: gh-pages branch + GitHub Actions (CI/CD)
# Seçenek B: manuel build/web klasörünü docs/ olarak commit

# Önerilen: GitHub Actions workflow
# .github/workflows/deploy.yml oluştur
```

**GitHub Actions workflow:**
```yaml
name: Deploy to GitHub Pages
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: 'stable'
      - run: flutter pub get
      - run: flutter build web --release --base-href "/"
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

### Adım 7: SEO & Meta

`web/index.html` düzenleme:
- Title: "Kamuran Doğan | Flutter Developer"
- Meta description: TR + EN
- OG tags (LinkedIn/Twitter paylaşım preview)
- favicon: KD monogram

---

## Broccolai Proje Verisi (Portfolioya Girecek)

```dart
ProjectModel(
  name: 'Broccolai',
  tagline: 'AI-powered football predictions',
  description: 'Flutter app that generates AI football match predictions with confidence scoring, value bet analysis, and betting coupon builder. Available on iOS & Android.',
  techStack: ['Flutter', 'Dart', 'Supabase', 'Firebase', 'Riverpod', 'RevenueCat'],
  platforms: ['iOS', 'Android'],
  appStoreUrl: '...',
  googlePlayUrl: '...',
  screenshots: ['assets/broccolai_1.png', ...],
  accentColor: Color(0xFF7CFC00), // neon green
)
```

---

## Doğrulama / Test

- [ ] `flutter run -d chrome` ile local test
- [ ] Responsive: 320px (mobile) → 1440px (desktop)
- [ ] Dil switcher TR ↔ EN çalışıyor
- [ ] Tüm linkler (App Store, GitHub, email) açılıyor
- [ ] `flutter build web --release` hatasız build
- [ ] GitHub Actions deploy başarılı
- [ ] `https://kamurandogan.github.io` canlıda açılıyor
- [ ] Lighthouse score: Performance 85+, Accessibility 90+

---

## Sıradaki Adım

1. Google Stitch'e yukarıdaki promptları ver → ekran görüntülerini al
2. `kamuran_dogan_portfolio` Flutter projesi oluştur
3. Tema ve renk sistemini kodla
4. Section'ları sırasıyla geliştir (Hero → Projects → Skills → Contact)
5. GitHub repo oluştur + Actions deploy kur
