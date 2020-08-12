assert_tuner = function(tuner) {
  assert_r6(tuner, "Tuner")
}

assert_search_space = function(search_space, learner, clone = FALSE) {
  if (is.null(search_space)) {
    search_space = learner$param_set$to_tune_param_set
    if (is.null(search_space))
      stopf("search_space=NULL, but learner '%s' also has no associated tuning space!", learner$id)
  }
  if (clone)
    search_space = search_space$clone()
  return(search_space)
}
