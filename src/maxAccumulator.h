// [[Rcpp::depends(BH)]]
#ifndef MAX_ACCUMULATOR_H
#define MAX_ACCUMULATOR_H

#include <boost/accumulators/accumulators.hpp>
#include <boost/accumulators/statistics/max.hpp>
#include <boost/accumulators/statistics/stats.hpp>

class maxAccumulator {
  typedef boost::accumulators::stats<boost::accumulators::tag::max> maxTag;
  typedef boost::accumulators::accumulator_set<unsigned int, maxTag>
      maxAccumInternal;

public:
  void update(unsigned int value) { m_accum(value); }

  unsigned int value() { return boost::accumulators::max(m_accum); }

private:
  maxAccumInternal m_accum;
};

#endif
