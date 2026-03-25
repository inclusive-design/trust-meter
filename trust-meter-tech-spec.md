---
title: Trust meter Introduction
---

----

Cover note: This is a stab at a high-level organization for the guidance the
Trust Meter project is being asked for. Corrections, clarifications, and
elaborations are appropriate throughout-- this is intended only as a starting
point. I’ve marked with >> one place where some more specifics are especially
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

## Problem

In statistics, an outlier is "an observation that lies an abnormal distance from
other values in a random sample from a population".[^1] Membership in one or
more social groups that are subject to systemic discrimination can result in a
person's being an outlier in information  provided to an artificial intelligence
(AI) system. This outlier status is due not merely to the fact of group
membership.  Rather, it should be understood as arising from the many respects
in which the circumstances, history and life experiences of such a group members
can differ from those of larger populations. If the AI system fails to respond
appropriately to the individual's specific  situation as reflected in the data
presented to it, there is a risk of amplifying or further perpetuating
discrimination.

The risk is greatest if the system is used directly or indirectly to make
decisions affecting the person's human rights or other legal interests.  When
differences of gender, race, ethnicity, socio-economic position, or disability,
for example, become salient to the operation of AI systems due to the
under-representation or misrepresentation of outliers in data, there thus emerges
a heightened risk of discriminatory decisions. Established practices of social
marginalization are reinforced, contrary to moral obligations and human rights
standards.

[^1]: NIST/SEMATECH e-Handbook of Statistical Methods, [section
7.1.6](https://www.itl.nist.gov/div898/handbook/prc/section1/prc16.htm).

## Purpose

The purpose of this note is to outline some of the potential problems for
members of marginalized social groups posed by AI tools, and approaches to
mitigating these problems. The focus is on problems that arise from a person's
being different, or represented as being different, from other people, rather
than on the problem of bias that arises when AI tools may embed biased attitudes
about an individual due to salient group membership, such as having a specific
gender, ethnicity, disability, or a combination thereof.

## Scope

The terms of reference define the scope of this report as follows.

>The Trust Meter is a non-normative Technical Specification that addresses
>statistical discrimination against data outliers and small minorities in
>mechanized statistical reasoning in AI decision tools.
>The Trust Meter Technical Specification is a framework that provides guidance
>for AI implementers to understand and anticipate potential harms such as when
>the scenario, group or individual about whom the decision is made is out-of-
>distribution relative to the training set the model is trained on, the AI’s
>decisions in this context may be unreliable.

Having regard to the range of AI systems that can play a role in
decision-making, the scope is here interpreted according to the additional
points below.

- The technical specification applies to machine‑learning‑based classification
  systems used in decision‑making.
- It also applies to systems providing information or advice intended to be
  taken into account by a human agent as a step toward reaching a decision.
- The guidance is non‑normative and intended to support implementers, operators,
  and reviewers.
- It outlines concepts, risks, and mitigation strategies that can inform future
    standards.
- This report provides foundational guidance to support adoption but does not prescribe
    conformance requirements

## Kinds of AI Tools

AI tools can be grouped along two dimensions: **what** they are designed to do, and
**how** they produce results.

**Task-Specific AI** **tools** are designed and trained to perform one particular task
or set of tasks.

- _Supervised:_ The tool learns from examples where the correct answer has been
  provided by a human. For example, a spam filter is trained on thousands of emails,
  each labeled "spam" or "not spam."
- _Unsupervised:_ The tool finds patterns or structure in data without being given
  correct answers. For example, a customer segmentation tool groups shoppers by
  purchasing behavior without being told in advance what the groups should be.

**General-Purpose AI** **tools** can be applied to many different tasks across many
domains.

- _Discriminative:_ The tool analyzes, classifies, or retrieves information without
  producing new content. For example, a search engine ranks web pages by relevance to a
  query, and a general-purpose embedding model can be used for search, classification,
  or clustering across many domains.
- _Generative:_ The tool produces new content such as text, images, or code. For example,
  Large Language Models (LLMs) like ChatGPT can answer questions, summarize documents,
  translate text, or write code, all based on instructions given as a prompt.

In practice, many tools combine elements of both categories. A general-purpose model is
often **adapted** to a specific task through one of several mechanisms:

- _Transfer learning:_ A general-purpose discriminative model, pre-trained to produce
  useful representations of data, is adapted to perform a specific task using a
  relatively small amount of task-specific training data. For instance, a model trained
  to recognize general features in images might be adapted to detect specific
  manufacturing defects on a factory production line. In deep learning, this is often
  done by keeping the base model fixed and training a small additional layer on top of
  it; in other settings, the model's parameters may be adjusted more broadly.
- _Fine-tuning:_ A general-purpose generative model may be further trained on
  task-specific examples to improve its performance in a particular domain. For instance,
  a general-purpose LLM might be fine-tuned on legal documents to make it more useful for
  legal research.
- _In-context learning:_ Rather than additional training, examples or instructions may be
  included directly in the prompt given to the model. The model uses these to guide its
  response. This exploits a notable capability of general-purpose models: their behavior
  can be shaped by the content of the input itself.
- _Retrieval:_ Because it is difficult to add new information to a model after training,
  many tools are given the ability to consult external data sources. For example, they
  may search the web or look up information in private databases, such as client records
  or organizational policies. This allows the tool to draw on current and specific
  information that was not part of its training data.

## Potential Problems for Marginalized Groups

Different kinds of AI tools present different kinds of problems, with different possible
remedies. Below, we organize the discussion by the problem itself, and note which kinds
of tools are most susceptible.

### Representation Problems

An obvious problem arises due to **under representation**: if the examples used in
creating or shaping a tool don't include examples that reflect the situations or needs of
a diversity of people, especially those at risk of discrimination. It's clear that if
members of marginalized groups and their circumstances aren't represented in the shaping
of a tool, there's a real risk that the tool will produce inappropriate responses. This
affects any tool that learns from data, whether task-specific or general-purpose, and
whether the examples are used in initial training, fine-tuning, or prompts.

A related but distinct problem is **misrepresentation**: the training data may include
members of a group, but in proportions or contexts that don't reflect reality. For
example, if a hiring tool is trained on historical data in which women were
underrepresented in senior roles, the tool may learn to associate seniority with men, not
because women are absent from the data, but because the data reflects past patterns of
discrimination rather than actual qualifications. The group is present, but the picture
the model forms of it is distorted.

An extreme case of misrepresentation arises for **outliers**: groups or individuals so
rare in the training data that the model has too few examples to learn their patterns at
all — not enough data to even compute meaningful statistics.

### Performance Problems

AI tools are typically evaluated using **aggregate performance metrics*:** a single
number that summarizes how well the tool does across all examples. These metrics
naturally reward doing well on common cases, since those contribute most to the overall
score. A tool can appear to perform well on average while performing poorly for groups or
individuals whose circumstances are uncommon. For example, a model that does well in
evaluating applicants with common employment records, and so looks good on the average,
may do poorly for people with unusual records, such as a person with a disability who has
gaps in their employment history.

This is not simply a matter of rare errors. The training process itself pushes the model
to form a simplified, approximate picture of the data, one that is more accurate for
examples whose features are common than for those whose features are uncommon. People who
are already at risk of discrimination are often different from the average in relevant
respects, and are therefore more likely to receive unreliable results, even when their
data was present in the training set.

Performance can also be **brittle:** small changes in input may produce unexpectedly
different outputs. For example, Wang et al. found that seemingly equivalent medical
questions often received different answers from generative AI systems. A special form of
this is sycophancy, where the tool adjusts its answer to match what the user appears to
want. These problems affect all users, but they may have special impact on people whose
circumstances are already poorly captured by the model, since there is less basis for the
tool to fall back on, and on people with cognitive limitations, who may be less able to
detect and correct unreliable results.

### Loss of Context

AI tools are shaped by the data and settings in which they were created. When they are
applied outside those boundaries, their reliability may degrade in ways that are difficult
to predict.

**Generalization out of context.** A tool may be applied in a setting, population, or
domain that differs from the one it was trained or evaluated on. For example, a hiring
tool trained on data from one industry may perform poorly when used in another, or a
model trained primarily on English-language text may produce unreliable results for other
languages or cultural contexts. This affects both task-specific and general-purpose
tools, and poses particular risks for marginalized groups whose contexts are less likely
to have been represented in the tool's original setting.

**Fabrication.** Generative AI systems sometimes produce plausible-sounding but false
information, for example by referring to sources that don't actually exist. This is
sometimes called hallucination. The model lacks the context to distinguish what it knows
from what it is inventing. This poses issues for all users, but may have special impact
on people with cognitive limitations, who may be less able to detect and correct
fabricated results.

**Retrieval errors.** Many tools are given the ability to consult external data sources,
such as the web or private databases, to compensate for the limits of what was included
in training. But this introduces its own risks: the tool may frame its query incorrectly,
retrieve irrelevant or outdated information, or misinterpret what it finds. The tool is
operating in a context (i.e., the external data source) that it was not trained on
directly, and its reliability in navigating that context is not guaranteed.

In each of these cases, the common thread is that the tool is being asked to perform
beyond the boundaries of its training or design. People whose circumstances are unusual
or underrepresented are more likely to fall outside those boundaries, and are therefore
more likely to be affected.

### Opacity

Our understanding of how complex AI systems actually work is very limited. Although their
basic structure and operation is completely known, how such a system responds in any
given situation is determined by a huge number of parameters, interacting in very complex
ways. This means that when a problem occurs, it is in general not clear how to correct
it. Further training (fine-tuning) or adding material to prompts may work, but it is hard
to be sure, or to know how these corrections may affect other aspects of the system's
behavior. This isn't a problem for users directly, but it is a problem for tool creators.

This affects any tool based on complex models, whether task-specific or general-purpose.

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

In some applications, it may be possible to maintain a corpus of known, accurate
responses that the system  can reproduce whenever substantively identical
queries are made. This approach limits the number of novel responses that need
to be created by FB systems. However, it is only effective if substantively
identical prompts can be detected based on semantic similarity searches of the
corpus.

### Testing

Of course testing is one way to limit problems when systems are deployed.
Testing for AI tools differs from testing of conventional software, however, in
consequential ways. For conventional software there is a tightly specified space
of permissible inputs, and for each input there is a specified correct output.
For ET systems something like this situation may still hold, at least in
simple cases. Inputs to the system might be limited to a specified format, and
in simple cases it may be possible to work out exactly what the correct response
would be. But often, even for ET systems, it may not be clear what response is
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
granted that there is no way to be certain that a human help-line worker will
answer all questions correctly. Our millennia-long experience of working with
humans provides us with some heuristics for assessing whether someone is likely
to be reliable, though. Do they seem conscientious? Are they good on details? We
live with the residual uncertainty. So far we lack any comparable grasp of how
to work with FB systems.

The situation is a bit better for simple ET systems. Some of these map data
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
handled their case correctly. If legal rights or interests are at stake,
effective appeal and review procedures should be put in place to ensure adequate
human supervision.

The feedback system should include clients having access to human assistance,
providing a way past the system that hasn’t understood their situation.
Everybody knows how frustrating it can be when one can’t talk to a person, when
some system isn’t doing what we need. This frustration won’t be any less when
systems seem to be more intelligent.

### Continuous improvement

When the AI system gets things wrong, what then? One would like to be able to
improve the system, so that similar cases are handled correctly in future. As
discussed above, however, this isn’t so easy. One can’t just patch the AI system
as one can for fixing bugs in conventional software.

For ET systems >>can someone look in the literature for how one can improve a
classifier system?<<

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




