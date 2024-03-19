export PIPENV_VENV_IN_PROJECT=true

.PHONY: clean
clean:
	mkdir -p Formula
	rm -rf .venv
	rm -f Pipfile Pipfile.lock
	pipenv --python 3.12
	pipenv install --dev homebrew-pypi-poet

.PHONY: frogmouth
frogmouth: clean
	pipenv install frogmouth
	pipenv run poet -f frogmouth > Formula/frogmouth.rb
	sed -i '' 's/Shiny new formula/A Markdown browser for your terminal/' Formula/frogmouth.rb

.PHONY: see
see: clean
	pipenv install textualize-see
	pipenv run poet -f textualize-see > Formula/see.rb
	sed -i '' 's/Shiny new formula/A file opener for the terminal/' Formula/see.rb
	sed -i '' 's/TextualizeSee/See/' Formula/see.rb

.PHONY: textual-web
textual-web: clean
	pipenv install textual-web
	pipenv run poet -f textual-web > Formula/textual-web.rb
	sed -i '' 's/Shiny new formula/Run TUIs and terminals in your browser/' Formula/textual-web.rb

.PHONY: toolong
toolong: clean
	pipenv install toolong
	pipenv run poet -f toolong > Formula/toolong.rb
	sed -i '' 's/Shiny new formula/A terminal application to view, tail, merge, and search log files (plus JSONL)/' Formula/toolong.rb
