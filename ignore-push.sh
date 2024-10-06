chezmoi add ~/.config/nvim/lazy-lock.json

git add .
git commit -m "Deploy"
git push

chezmoi forget --force ~/.config/nvim/lazy-lock.json
