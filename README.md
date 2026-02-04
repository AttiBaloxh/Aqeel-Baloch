# personal_portfolio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deployment to GitHub Pages

This project is configured to automatically deploy to GitHub Pages using GitHub Actions.

### Steps to Deploy:

1.  **Create a New Repository on GitHub:**
    *   Go to GitHub and create a new repository (e.g., `my-portfolio`).
    *   Do *not* initialize it with a README, .gitignore, or license (we already have them).

2.  **Push Your Code:**
    Run the following commands in your terminal (replace `your-username` and `your-repo-name`):

    ```bash
    git remote add origin https://github.com/your-username/your-repo-name.git
    git branch -M main
    git push -u origin main
    ```

3.  **Configure GitHub Pages:**
    *   Go to your repository **Settings** > **Pages**.
    *   Under **Source**, select `Deploy from a branch`.
    *   Under **Branch**, select `gh-pages` (this branch will be created automatically by the Action after your first push finishes).
    *   Click **Save**.

4.  **Visit Your Site:**
    *   Your site will be live at `https://your-username.github.io/your-repo-name/`.

### Note on Base HREF:
The deployment workflow automatically sets the base href to `/your-repo-name/`.
If you are deploying to your main user page (`username.github.io`), you need to edit `.github/workflows/deploy.yml` and change:
`flutter build web --release --base-href "/$REPO_NAME/"`
to:
`flutter build web --release --base-href "/"`
