all : plot pdf
.PHONY : all

.PHONY : plot
plot : img/

img/ : Ph20_Set_3.ipynb
	rm -rf $@
	mkdir $@
	jupyter nbconvert --execute --allow-errors --to notebook --inplace Ph20_Set_3.ipynb

Ph20_Set_3.py : Ph20_Set_3.ipynb
	jupyter nbconvert --to script Ph20_Set_3.ipynb

.PHONY : pdf
pdf : Ph20_Set_3.pdf
Ph20_Set_3.pdf : Ph20_Set_3.tex git.log Ph20_Set_3.py
	pdflatex $<
	pdflatex $<
	rm -f *.log
	rm -f *.aux
	rm -f *.py

git.log : 
	git log > git.log

Ph20_Set_3.py : Ph20_Set_3.ipynb
	jupyter nbconvert --to script  Ph20_Set_3.ipynb

.PHONY : clean
clean :
	rm -rf img
	rm -r *.pdf
	rm -f *.py
