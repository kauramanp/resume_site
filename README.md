# resume-site

A personal resume site built with **Flutter (web)**, styled around a CI/CD
pipeline theme, and deployed automatically with **GitHub Actions** to
**GitHub Pages**.

It doubles as a template: everyone in the room can fork this repo, swap in
their own details, and have a live resume site deployed in a few minutes —
which is exactly what the GitHub Actions workflow in this repo demonstrates.

## Preview locally

```bash
flutter pub get
flutter run -d chrome
```

## Make it yours

Only one file needs to change to turn this into *your* resume:

```
lib/data/resume_data.dart
```

Edit the `resumeData` object with your own name, role, summary, skills,
experience, and projects. Everything else — layout, theme, navigation —
reads from that file automatically.

Two more things to swap:

- **`web/resume.pdf`** — replace with your own resume PDF; it's what the
  "Download resume" button on the hero section links to.
- **`web/icons/*`, `web/favicon.png`** — optional, regenerate with
  `flutter create .` if you want your own app icon instead of the
  placeholder one included here.

## Deploy it with GitHub Actions

1. Push this repo to GitHub.
2. In the repo, go to **Settings → Pages** and set **Source** to
   **GitHub Actions**.
3. Push to `main` (or run the workflow manually from the **Actions** tab).
4. Your site goes live at `https://<your-username>.github.io/<repo-name>/`.

### How the workflow works

The whole thing lives in [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml)
and is written to be read, not just run — it's commented section by section
and is a good one to project during a GitHub Actions talk. In short, it has:

- **A trigger** (`on: push`) that fires the workflow on every push to `main`,
  plus a manual `workflow_dispatch` trigger for the "Run workflow" button.
- **A `build` job** that checks out the code, installs Flutter, runs
  `flutter analyze` and `flutter build web`, and uploads the compiled site
  as a Pages artifact.
- **A `deploy` job** that depends on `build` (`needs: build`) and publishes
  that artifact to GitHub Pages using an `environment`, which is what gives
  you the clickable deployment URL on the repo's home page.
- **Minimal permissions** (`pages: write`, `id-token: write`) — a good
  moment to talk about the principle of least privilege for CI tokens.

### A live demo idea for the talk

Change a line of text in `lib/data/resume_data.dart`, commit, and push —
then watch the **Actions** tab build and redeploy the site in real time.

## Project structure

```
lib/
  data/resume_data.dart     ← all resume content (edit this)
  models/resume_models.dart ← plain data classes for the content above
  theme/app_theme.dart      ← colors, type scale, breakpoints
  widgets/                  ← one file per UI section
  screens/home_screen.dart  ← page layout + scroll-spy navigation
  main.dart                 ← app entry point
web/
  index.html, manifest.json, icons/, resume.pdf
.github/workflows/deploy.yml← the CI/CD pipeline described above
```

## Built with

Flutter · [google_fonts](https://pub.dev/packages/google_fonts) ·
[url_launcher](https://pub.dev/packages/url_launcher)
