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
	pipenv install $@
	pipenv run poet -f $@ > Formula/$@.rb
	sed -i '' 's/Shiny new formula/A Markdown browser for your terminal/' Formula/$@.rb

.PHONY: see
see: clean
	pipenv install textualize-see
	pipenv run poet -f textualize-see > Formula/$@.rb
	sed -i '' 's/Shiny new formula/A file opener for the terminal/' Formula/$@.rb
	sed -i '' 's/TextualizeSee/See/' Formula/$@.rb

.PHONY: textual-web
textual-web: clean
	pipenv install $@
	pipenv run poet -f $@ > Formula/$@.rb
	sed -i '' 's/Shiny new formula/Run TUIs and terminals in your browser/' Formula/$@.rb

.PHONY: toolong
toolong: clean
	pipenv install $@
	pipenv run poet -f $@ > Formula/$@.rb
	sed -i '' 's/Shiny new formula/A terminal application to view, tail, merge, and search log files (plus JSONL)/' Formula/$@.rb
