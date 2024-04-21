NAME = BLOG-TARGET
remote = origin
remote_branch = main
redirect = > /dev/null 2>&1
ignore = Makefile
files = $(filter-out $(ignore), $(shell ls))

.PHONY: commit clean push nil

nil:

commit: 
	@echo "+ COMMIT" $(NAME)
	@git add -A $(redirect)
	@-git commit -m 'make commit' $(redirect)

push:
	echo "+ PUSH" $(NAME)
	@-git push $(remote) $(remote_branch) $(redirect)

clean:
	@echo "- CLEAN" $(NAME)
	@rm -rf $(files)
