export PIPENV_VENV_IN_PROJECT=true

clean:
	mkdir -p Formula
	rm -rf .venv
	rm -f Pipfile Pipfile.lock
	pipenv --python 3.12
	pipenv install --dev homebrew-pypi-poet

frogmouth: clean
	pipenv install frogmouth
	pipenv run poet -f frogmouth > Formula/frogmouth.rb
	sed -i '' 's/Shiny new formula/A Markdown browser for your terminal/' Formula/frogmouth.rb

toolong: clean
	pipenv install toolong
	pipenv run poet -f toolong > Formula/toolong.rb
	sed -i '' 's/Shiny new formula/A terminal application to view, tail, merge, and search log files (plus JSONL)/' Formula/toolong.rb