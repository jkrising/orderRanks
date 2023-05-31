#ifndef USER_INTERRUPT_CHECKER_H
#define USER_INTERRUPT_CHECKER_H

#include <Rcpp.h>
#include <chrono>

class userInterruptChecker {
  typedef std::chrono::steady_clock Clock;
  typedef std::chrono::duration<double> Duration;
  typedef Clock::time_point TimePoint;

public:
  userInterruptChecker(unsigned int threshold = 1)
      : m_lastCheck(Clock::now()), m_threshold(threshold) {}

  void check() {
    TimePoint now = Clock::now();
    const Duration timePassed = now - m_lastCheck;
    if (timePassed.count() > m_threshold) {
      Rcpp::checkUserInterrupt();
      m_lastCheck = now;
    }
  }

private:
  TimePoint m_lastCheck;
  unsigned int m_threshold;
};

#endif
