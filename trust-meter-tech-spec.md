---
title: Trust meter Introduction
---

----

Cover note: This is a stab at a high-level organization for the guidance the
Trust Meter project is being asked for. Corrections, clarifications, and
elaborations are appropriate throughout-- this is intended only as a starting
point. I’ve marked with ## one place where some more specifics are especially
needed, but no doubt there are many others.

Something not indicated here is where we should insert examples. There might be
of two kinds (1) examples of harms people with disabilities have experienced.
There may not yet be many of these for AI systems, but with careful presentation
we can likely use some from older systems. (2) it would be great to have
examples of how some of these ideas are being addressed in systems we’re
learning about. For example, the AI Answers system stores past answers, and they
may envision using this as a way to correct bad information. It also illustrates
the lookup idea, making that more concrete for readers. For that matter, it
might be used to make another point, not in the draft: AI systems are likely to
implement quite complex, multi-stage, and branched  information flows, with
problems possible at many junctures.

Cheers, Clayton

----

## Purpose

The purpose of this note is to outline some of the potential problems for people
with disabilities and those who support them posed by AI tools, and approaches
to mitigating these problems. The focus is on problems that arise from people
with disabilities being different, or represented as being different, from other
people, rather than on the problem of bias, that arises when AI tools may embed
biased attitudes about people with disabilities.

## Scope

- The technical specification applies to machine‑learning‑based classification
  systems used in decision‑making. - Generative and LLM‑based AI systems are out
  of scope unless they form a component of a classification pipeline that
  produces consequential decisions.
- The guidance is non‑normative and intended to support implementers, operators,
  and reviewers.
  - outlines concepts, risks, and mitigation strategies that can inform future
    standards.
  - provides foundational guidance to support adoption but does not prescribe
    conformance requirements

## Statistical Discrimination

Mechanisms of statistical discrimination include:

- The technical specification applies to machine‑learning‑based classification
  systems used in decision‑making.
- Generative and LLM‑based AI systems are out of scope unless they form a
  component of a classification pipeline that produces consequential decisions.
- The guidance is non‑normative and intended to support implementers, operators,
  and reviewers.


## Definitions

### Example Trained – “ET”

The AI tool training data is examples with predefined correct responses.  A
classification AI is an example of an ET tool.

### Foundation Based – “FB”

The AI tool is trained but not using specific examples.  Instead, they are
trained on vast amounts of text or media.  An example of an FB is a Large
Language Model (LLM).

## Kinds of AI tools.

We distinguish two kinds of AI tools. One kind of tool is trained on a
collection of examples, such as job applications, with designated correct
responses provided for the examples. The training is intended to shape the tool
so that its responses on the training examples approximates the designated
responses, on the examples. The tool is then applied to new examples, and the
hope is that it will respond appropriately to these. We’ll call these tools
_example trained_, or ET.

A second kind of tool is exemplified by Large Language Models (LLMs). These
systems are also trained, but not on specific examples of a particular task.
Rather they are trained on vast amounts of text or media, with the task of
predicting the sequence in which material occurs in the training corpus.
Remarkably, this training has been shown to provide a foundation for an enormous
range of specific tasks, even with no specific training on these. We’ll call
these tools _foundation based_, or FB.

Few tools are purely FB. Rather, many tools combine FB with subsequent example
training that can be supplied in various ways. One way is to carry on a separate
training phase, called _fine tuning_, in which an underlying FB system is
adjusted to better approximate patterns of responding, as represented in
examples used in the tuning process. Another way does not use training as such,
but rather provides examples in a prefix applied to the prompts that are the
inputs to the model when it is used. This second way exploits another remarkable
capability of FB systems, that their responses can be effectively shaped by
material included in the prompts.

Some FB tools now have _lookup capabilities_. Because it is technically
difficult to add new information to FB systems, it’s common to give them the
ability to consult data sources outside themselves. For example, they may do Web
searches, or look information up in private data bases, for example, collections
of information about clients, or about the policies of an organization.

## Potential problems for people with disabilities

### Problems with ET tools

These different kinds of tools present different kinds of problems, with
different possible remedies. Let’s consider first ET tools, along with FB tools
in which examples are used, either in fine tuning or in prompts. An obvious
problem arises if the examples used in creating or shaping these tools don’t
include examples that reflect the situations or needs of people with
disabilities. We’ll call this the _representation_ problem. It’s clear that if
people with disabilities and their needs aren’t represented in the shaping of a
tool, it’s very possible that the tool will produce inappropriate responses.

However, even if representation is achieved, ET tools can be problematic for
people with disabilities. Commonly, ET tools work by creating a mathematical
model of the examples on which they are trained. This model can’t capture all
the details of the examples, but forms a simplified, approximate picture of the
examples. The training process pushes the model to do a good job on the average,
not to give the correct response on every example. That means that the
simplified model will be more accurate on examples whose features are common in
the collection of examples, than on examples whose features are uncommon.

This works against people with disabilities, in many cases. Their situations are
often different from those of most people, in many respects. For example, a
person with a disability may have an unusual employment record. A model that
does well in evaluating applicants with common employment records, and so looks
good on the average, may do poorly for people with unusual records. We’ll call
this the _averaging_ problem, associated with unusual examples, called outliers.

This problem is sometimes considered as the problem of _out of sample_ data. But
that’s what we’re calling the _representation_ problem. The averaging problem
can occur even for examples that are included in the training examples, that is,
for cases that are in sample, not out of sample.

In the literature, an outlier is often defined as an exemplar that is so
different from the other examples in a population that it must represent a
different population, or result from a different process, than the rest of the
population. In experimental data, it’s not uncommon for outliers to be excluded
from analysis, as reflecting some irrelevant failure of procedure.

In our situation, excluding outliers is obviously not appropriate. But
identifying them can be a method of mitigating the averaging problem, as we’ll
discuss.

## Problems with FB tools

We consider here problems that aren’t traceable to a collection of examples that
was used to train or shape the responses of a tool, but rather to the
characteristics of FB tools. All of these problems are becoming less common as
the technology advances, but all remain issues that tool creators need to
address today.

### Brittleness

This refers to changes in behaviour in response to small changes in inputs. It’s
 also called prompt sensitivity. Traditional automation is notoriously brittle,
in that it commonly responds only to well-formed inputs. An input that is even
slightly incorrect, or slightly outside the designed scope of a traditional
tool, may not be processed at all. By contrast, FB tools may respond
appropriately to a wide range of inputs. For example, questions can often be
framed in many different ways, and be answered appropriately. However, it can
also happen that one input gets an appropriate response, and another, that seems
as if it should be equivalent, gets a different response. For example, [Wang et
al.](https://www.nature.com/articles/s41746-024-01029-4.pdf ) found that
seemingly equivalent medical questions often received different answers from FB 
systems.

A special form of prompt sensitivity is sycophancy: FB systems will sometimes
offer answers that the user may appear to want, based on the input the user
provides. 

### Hallucination

Sometimes FB systems fabricate answers, for example by referring to sources of
information that don’t actually exist.

These problems obviously pose issues for all users, not just people with
disabilities. But they may have special impact on people with cognitive
limitations, who may be less able to detect and correct them.

### Opacity

Our understanding of how FB systems actually work is very limited. Although
their basic structure and operation is completely known, how an FB system
responds in any given situation is determined by a huge number of parameters,
interacting in very complex ways. This means that when a problem occurs in an FB
system, it is in general not clear how to correct it. Further training (fine
tuning) or adding material to prompts may work, but it is hard to be sure, or to
know how these corrections may affect other aspects of the system’s behavior.
This isn’t a problem for users, directly, but it is a problem for tool creators.

### Variability

Another problem for tool creators is that different FB tools behave differently.
A tactic that works well for Claude, say adding some language to prompts, may
work differently for Gemini. This makes it difficult for tool creators to learn
from one another.

### Problems of lookup

The issues we’ve been discussing apply to the lookup capabilities of FB tools,
as well as to the core capabilities of such tools. Will the tool frame its
lookup correctly? Will it interpret what it finds correctly? It’s hard to be
certain.

## Mitigating the problems

### Representation

The basic approach here is to use a large, inclusive sample when training
systems. This is easy in principle, but hard in practice, because people vary in
so many consequential ways. Also, these many differences commonly interact. That
is, knowing about people with attribute A, and people with attribute B, is not
enough to know about people that have both attributes. The number of individual
cases needed for adequate coverage in a training sample may easily be
impractically large.

### Averaging

There is a literature on outlier detection that offers tools for determining how
different a given case is from a collection of other cases. For ET systems, or
for FB systems with additional examples used in shaping them, it would be
reasonable to add a processing step in which such an assessment would be made
for each new case. Cases that are determined to be quite different from the
examples would be routed for special processing. 

### Brittleness

As far as we know, this is an unsolved problem for people deploying FB tools.
Available tools are getting better, over time, but the improvements seem to
result from the ever-increasing size of the models that large development
organization are creating. Deployers may just have to wait for these problems to
be eased by the work of the organizations that command the resources needed for
this work. We return to the brittleness problem below.

### Sycophancy

Some improvement in this particular form of prompt sensitivity may be possible
by adding instructions to the prompts: “Don’t tell me what you think I want to
hear.” As with other aspects of FB behavior, it’s hard to know how effective
that would be.

### Hallucination

As for brittleness, this problem is shrinking over time, but it’s still there.
In some cases, lookup facilities can be used to limit hallucinations. If an FB
system is limited to providing answers that are quoted from a database,
hallucinations are less likely. This can be approached by adding directives to
prompts, but one can’t be sure that is completely effective. Another approach
would be to implement a data flow in which responses come directly from a
trusted data source, once identified by an FB system. Here the FB could not
fabricate responses, since it does not respond directly to users.

Another approach to hallucination, that can also be applied for brittleness, is
the creation of guardrails. A guardrail is a facility that examines the input
to, or output from, a system, and intervenes in some way to modify the system’s
response. For example, a guardrail could tell a user that the system can’t
answer a particular kind of question, if developers have found that
hallucinations are likely for those questions. Similarly, a guardrail could flag
questions for which variations in response based on the form of the prompt might
be risky. Rather than blocking an input, a guardrail could call for special
processing, for example deliberately reframing a question, and comparing the
responses obtained for different framings, before responding.

### Testing

Of course testing is one way to limit problems when systems are deployed.
Testing for AI tools differs from testing of conventional software, however, in
consequential ways. For conventional software there is a tightly specified space
of permissible inputs, and for each input there is a specified correct output.
For ETEB systems something like this situation may still hold, at least in
simple cases. Inputs to the system might be limited to a specified format, and
in simple cases it may be possible to work out exactly what the correct response
would be. But often, even for ETEB systems, it may not be clear what response is
correct, if an input instantiates a new constellation of attributes.

For FB systems the situation is usually much worse. Part of the value of FB
systems is their flexibility: there’s no specification of exactly how inputs
must be expressed. Further, a correct response need not be framed in some
particular way. Determining that the output produced for a given input is
complex. As a result, while conventional software testing can be extensively
automated,  testing of FB tools can usually only be automated by using FB tools
themselves. This kind of testing that lead to increased confidence that the
system works properly, but it can’t give the kind of certainty that conventional
software testing often provides.

Another contrast with conventional software is test coverage. In testing
conventional software it’s common to devise a suite of test cases for which
every piece of code in the system must be executed. This doesn’t ensure that all
possible paths through the code have been tested, but at least each part of the
system has been found to work, at least in some situation.

There is no comparable notion of test coverage for FB systems. As mentioned
earlier, their behaviour is produced by the interactions of virtually countless
numerical parameters. There’s no way to enumerate the ways these should work.

There’s a parallel here with the testing of human employees. We take it for
granted that there is no way to be certain that a human help line worker will
answer all questions correctly. Our millennia-long experience of working with
humans provides us with some heuristics for assessing whether someone is likely
to be reliable, though. Do they seem conscientious? Are they good on details? We
live with the residual uncertainty. So far we lack any comparable grasp of how
to work with FB systems.

The situation is a bit better for simple ETEB systems. Some of these map data
into a geometric space, and testing can explore how the system behaves in
different regions of this space. However, even if a system looks good viewed in
this way, the averaging problem means we can’t be sure it will work well for
unusual cases.

Human in the loop. In view of these uncertainties  surrounding AI systems,
prudent developers will find ways to provide human oversight over the operation
of such systems. This is another parallel with working with humans: a prudent
manager will provide some oversight over what their human employees are doing.

It would be especially useful to provide human oversight on the handling of
unusual cases. As we’ve seen, these are especially likely to be mishandled,
especially for ET systems. Even for FB systems, since most of them have a good
deal of example-based shaping, having a human check the results of cases that
aren’t much like the examples would be a good idea.

There are some practical problems to be confronted in this prudent scheme.
First, how are the unusual cases to be identified? One needs to find a method
that will work for the particular kind of data that one is working with. The
isolation tree method (Liu, F. T., Ting, K. M., & Zhou, Z. H. (2012).
Isolation-based anomaly detection. ACM Transactions on Knowledge Discovery from
Data (TKDD), 6(1), 1-39) has the reputation of being robust and flexible, but
one would need to try it out on one’s own data. Does it really flag the right
cases?

A second problem is ensuring that the human checking process would be
responsibly carried out. Especially if the AI tool works well, it would be easy
for attention to the checking to flag. Injecting synthetic data for which
corrections are needed could be a way to maintain vigilance. Then, who is going
to do the checking? It has to be someone with detailed knowledge of what an
appropriate response really is, including in unusual cases, not just anybody.

The people who have the most stake in the correct operation of a system are
often the people whose cases are being handled. There should be an easy feedback
system in place so that users can speak up when they feel the system has not
handled their case correctly.

This feedback system should include clients having access to human assistance,
providing a way past the system that hasn’t understood their situation.
Everybody knows how frustrating it can be when one can’t talk to a person, when
some system isn’t doing what we need. This frustration won’t be any less when
systems seem to be more intelligent.

### Continuous improvement

When the AI system gets things wrong, what then? One would like to be able to
improve the system, so that similar cases are handled correctly in future. As
discussed above, however, this isn’t so easy. One can’t just patch the AI system
as one can for fixing bugs in conventional software.

For ET systems ##can someone look in the literature for how one can improve a
classifier system?##

For an FB system with lookup, one could give the system the ability to look in a
database of past cases, when handling a new case. When testing, or user
experience, reveals problems, descriptions of these cases, and how they should
have been handled, would be added to this database.

Another approach that could be tried would be adding mishandled cases, with the
proper handling described, to future prompts. Modern FB systems support very
long prompts, so a good deal of corrective information could be added in this
way.

As with other aspects of these systems, these improvement processes need to be
monitored and checked. For example, adding a case with its proper processing
does not guarantee that the system will respond correctly to future cases.

## Conclusion

AI systems have promise in allowing agencies to provide better service, within
the always-pressing resource limitations that they face. Unfortunately they may
also pose problems for people in situations that aren’t common, who may have
questions that aren’t frequently asked, or need services that aren’t often
called for.  These same problems beset human-provided services, too. Can we
harness AI, with its flexibility, and ability to process vast amounts of
information, to do better?




