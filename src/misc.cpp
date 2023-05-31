// [[Rcpp::depends(BH)]]
#include "misc.h"

#include <algorithm>
#include <string>
#include <vector>

#include <boost/algorithm/string/join.hpp>

std::string join(const std::vector<unsigned int> &args,
                 const std::string &sep) {
  std::vector<std::string> sargs;
  std::transform(args.cbegin(), args.cend(), std::back_inserter(sargs),
                 [](unsigned int i) { return std::to_string(i); });
  return boost::algorithm::join(sargs, sep);
}
