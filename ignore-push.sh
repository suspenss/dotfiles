dot add ~/.config/nvim/lazy-lock.json

git add .
git commit -m "Deploy"
git push

dot forget --force ~/.config/nvim/lazy-lock.json
