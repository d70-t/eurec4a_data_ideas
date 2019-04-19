all:  data_distribution_design.pdf
.PHONY: all

%.pdf: %.md
	 pandoc -o $@ $^

clean:
	@- rm data_distribution_design.pdf
.PHONY: clean
