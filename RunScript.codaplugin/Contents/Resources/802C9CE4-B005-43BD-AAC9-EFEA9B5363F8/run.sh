#! /bin/bash
if [[ "${CODA_FILEPATH}" == *.py ]]; then
	MODE=python
fi

if [[ "${CODA_FILEPATH}" == *.rb ]]; then
	MODE=ruby
fi

if [[ "${CODA_FILEPATH}" == *.pl ]]; then
	MODE=perl
fi

if [[ "${CODA_FILEPATH}" == *.php ]]; then
	MODE=php
fi

if [[ "${CODA_FILEPATH}" == *.sh || "${CODA_FILEPATH}" == *.bash ]]; then
	MODE=bash
fi

if [ -n "$MODE" ]; then
	# extra redirection and piping to force coda to display stderr
	$MODE "$CODA_FILEPATH" 2>&1 | tee /dev/null
else
	echo "Unknown filetype or file has not been saved. File extension must be .bash, .php, .pl, .py, .rb or .sh."
fi