from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np
import tensorflow as tf

foo = tf.Variable([1, 2], tf.int32)
r = tf.rank(foo)
#foo2 = foo[0]
#print(foo)
tf.Print(foo, [foo])
t = tf.Print(foo, [foo])
result = t + 1
#rank = tf.rank(t)