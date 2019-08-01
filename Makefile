all:  README.pdf data_distribution_design.pdf user_stories.pdf boundary_conditions.pdf solutions.pdf
.PHONY: all

%.pdf: %.md
	 pandoc -o $@ $^

clean:
	@- rm data_distribution_design.pdf
.PHONY: clean
