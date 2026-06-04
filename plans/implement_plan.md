# Portfolio Implementation Plan

## Context

Kamuran Doğan'ın Flutter Web portfolyo sitesi. Tasarım Stitch'te tamamlandı (5 section: hero, projects slider, tech stack, contact, slide-in menu). pixel.melbourne'den ilham alınan bold & colorful stil. Amaç: iş başvurusu + freelance müşteri çekme. GitHub Pages'te host edilecek.

---

## Kararlaştırılan Detaylar

- **Projeler:** Broccolai + Wedlist
- **Broccolai görseller:** home_dashboard, matches, match_analysis (design_reference/ klasöründen)
- **Wedlist görseller:** logo + onboarding illustrasyonları birlikte
- **Dil switcher:** Sadece slide-in menü panelinde — şimdilik sadece İngilizce
- **Mail:** kamurandgn@gmail.com

---

## Renk Paleti

```dart
static const coral = Color(0xFFEC605A); // hero + contact zemin
static const lime  = Color(0xFFE9FD70); // logo, butonlar, aksan
static const pink  = Color(0xFFF4B8D1); // hero büyük metin + menü zemin
static const beige = Color(0xFFD4C5B0); // projects section zemin
static const black = Color(0xFF111111);
static const white = Color(0xFFFFFFFF);
```

---

## Paketler (pubspec.yaml)

```yaml
go_router: ^14.0.0
flutter_riverpod: ^2.5.1
google_fonts: ^6.2.1
flutter_animate: ^4.5.0
url_launcher: ^6.3.0
visibility_detector: ^0.4.0+2
```

---

## Klasör Yapısı

```
lib/
  main.dart
  app.dart
  core/theme/
    app_colors.dart
    app_theme.dart
    app_text_styles.dart
  features/
    nav/
      floating_nav.dart   # KD + Menu+ float bar
      menu_panel.dart     # sağdan açılan pembe panel
    hero/
      hero_section.dart
    projects/
      projects_section.dart
      project_card.dart
      project_data.dart
    skills/
      skills_section.dart
    contact/
      contact_section.dart
  shared/widgets/
    pill_chip.dart
```

---

## Asset Yapısı

```
assets/
  broccolai/
    home_dashboard.png  ← broccolai/design_reference/home_dashboard/screen.png
    matches.png         ← broccolai/design_reference/matches/screen.png
    match_analysis.png  ← broccolai/design_reference/match_analysis_details/screen.png
    icon.png            ← broccolai/assets/icons/broccolai_icon.png
  wedlist/
    logo.png            ← wedlist/assets/images/wedlist_logo_512.png
    planning.png        ← wedlist/assets/images/planning.png
    harcama.png         ← wedlist/assets/images/harcama.png
    takip.png           ← wedlist/assets/images/takip.png
    icon.png            ← wedlist/assets/app_icon.png
  cv/
    Kamuran_Dogan_Flutter_AI_CV.pdf  ← docs/Kamuran_Dogan_Flutter_AI_CV.pdf
```

---

## Sayfa Yapısı

```dart
Stack(
  children: [
    SingleChildScrollView(
      child: Column(children: [
        HeroSection(),     // tam ekran, coral #EC605A
        ProjectsSection(), // tam ekran, beige #D4C5B0
        SkillsSection(),   // tam ekran, lime #E9FD70
        ContactSection(),  // tam ekran, coral #EC605A
      ]),
    ),
    FloatingNav(),   // her zaman üstte
    MenuPanel(),     // sağdan AnimatedPositioned ile açılır
  ],
)
```

---

## Adımlar

### 1 — pubspec.yaml
Paketler + asset klasörleri + Google Fonts (Bricolage Grotesque, Hanken Grotesk)

### 2 — Asset kopyalama
Yukarıdaki asset tablosundaki dosyaları kaynak projelerden kopyala

### 3 — core/theme/
`app_colors.dart`, `app_text_styles.dart`, `app_theme.dart`

### 4 — FloatingNav + MenuPanel
- "KD" lime sol üst, "Menu +" lime sağ üst
- MenuPanel: pembe zemin, büyük bold nav linkleri, iletişim bilgileri, TR|EN (disabled)
- `menuOpenProvider` Riverpod bool state

### 5 — HeroSection
- Coral zemin tam ekran
- "FLUTTER\nDEVELOPER." — Bricolage 800, pembe renk, devasa
- Lime tagline + lime küçük iletişim metni sol alt

### 6 — ProjectsSection
- Bej zemin, PageView (viewportFraction: 0.75)
- Yan kartlar Transform.scale(0.88)
- Alt lime pill ok butonları
- Kart tıklanınca store URL açılır

### 7 — SkillsSection
- Lime zemin, "TECH STACK" siyah devasa
- Siyah pill chiplar: Flutter, Dart, Supabase, Firebase, Riverpod, GoRouter, RevenueCat, NestJS, PostgreSQL, Docker, Figma, GitHub, Codemagic
- Hover: chip beyazlaşır

### 8 — ContactSection
- Coral zemin, "LET'S TALK." pembe devasa
- 01/02/03 iletişim listesi lime
- "DOWNLOAD CV" lime pill butonu sağ alt

### 9 — web/index.html SEO
Title, meta description, OG tags güncelle

### 10 — Responsive
- Mobile <600px: hero font 56px, slider tam genişlik
- Tablet 600–1024px: orta ölçek
- Desktop >1024px: tam ölçek

### 11 — GitHub Actions deploy
`.github/workflows/deploy.yml` oluştur

---

## Eksik / Onay Bekleyen Bilgiler

1. **Store URL'leri** — Broccolai ve Wedlist App Store + Play Store linkleri (proje kartı butonu için)
2. **GitHub repo adı** — `kamurandogan.github.io` mu yoksa `kamurandogan/portfolio` mu? (base-href buna göre değişir)
