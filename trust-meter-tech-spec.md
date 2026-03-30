---
title: Trust meter Introduction
---

## Cover Note {-}

This is a public review draft. Corrections, clarifications, and suggestions for
improvement throughout the document are welcome and appreciated. The following
types of additional commentary are sought:

* Examples of harm that has resulted or may result from the application of AI
    systems, especially in cases of outliers. Harms demonstrated by earlier
    systems (not employing machine learning) are also of interest, in so far as
    they are relevant.
* Strategies not discussed in this draft for reducing the risk of discrimination
    associated with the use of AI systems directly or indirectly in
    decision-making.
* Examples or analyses indicating which of the strategies outlined in this draft
  have proven useful in mitigating risk in practice.

Comments may be submitted by any of the means below.

* Opening issues on the [GitHub
    repository](https://github.com/inclusive-design/trust-meter/issues) for this
    project, preferably with one comment per issue.
* Sending email to [vroberts@ocadu.ca](mailto:vroberts@ocadu.ca)

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

## Statistical Discrimination

When an AI system with a role in decision-making exhibits bias against
individuals due to presumed, often stereotyped, characteristics of marginalized
goups to which they belong, it  contributes to _statistical discrimination_.
This type of discrimination is generally morally and legally problematic.
It can occur under conditions in which a person's group identity is explicitly
disclosed to an AI tool. However, it can also arise in cases in which the group
identity is excluded from the data made available to the system, but
nevertheless becomes salient to the decisions via proxy variables. For example,
if members of a certain ethnic minority are concentrated in a segregated
suburb, an ET system might "learn" to discriminate against residents of this
locality, which thus serves as proxy for the marginalized ethnic identity.

Moreover, even if proxy variables are not at issue, data about members of
marginalized groups  can readily be different from the typical or average cases
on which AI systems perform relatively well. For example, a group member may
have a lower socio-economic status than average, or a frequently interrupted
employment history, which increases the risk of misclassification.

However statistical discrimination emerges in the operation of an AI tool, the
effect is to automate and reinforce existing prejudices, stereotypes, and
discriminatory practices against marginalized groups. The AI technology becomes
an amplifier of established social inequalities. Machine learning algorithms
enable negative assumptions about marginaized groups to be internalized by an AI
system and to influence subsequent decisions, potentially in unanticipated ways.

Outliers are particularly at risk of statistical discrimination, owing to the
under-representation of their diverse capabilities, needs and circumstances in
data on which a system is trained. Disability is a perspicuous example, in that
having a disability essentially amounts to being different from a societal norm,
and thus tending to be an outlier in ways that affect consequential decisions.

Preventing and mitigating the misclassification or mistreatment of outliers in
AI tools can accordingly be understood as a strategy for reducing immoral and
unlawful forms of statistical discrimination

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
different outputs. For example, [Wang et al.](https://www.nature.com/articles/s41746-024-01029-4.pdf)
found that seemingly equivalent medical questions often received different answers from
generative AI systems. A special form of this is sycophancy, where the tool adjusts its
answer to match what the user appears to want. These problems affect all users, but they
may have special impact on people whose circumstances are already poorly captured by the
model, since there is less basis for the tool to fall back on, and on people with
cognitive limitations, who may be less able to detect and correct unreliable results.

### Loss of Context

AI tools are shaped by the data and settings in which they were created. Context here
refers not only to the statistical conditions of training (the data, domain, and
population the tool was developed on) but also to the information and grounding a tool
would need to produce reliable outputs. When either form of context is missing,
reliability may degrade in ways that are difficult to predict.

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
from what it is inventing. This is not solely a problem of using the tool outside its
original training conditions; it arises from the basic nature of generative training, in
which the model learns to produce plausible outputs without tracking their evidential
basis. Fabrication can therefore occur even on topics well represented in the training
data. This poses issues for all users, but may have special impact on people with
cognitive limitations, who may be less able to detect and correct fabricated results.

**Retrieval errors.** Many tools are given the ability to consult external data sources,
such as the web or private databases, to compensate for the limits of what was included
in training. But this introduces its own risks: the tool may frame its query incorrectly,
retrieve irrelevant or outdated information, or misinterpret what it finds. The tool is
operating in a context (i.e., the external data source) that it was not trained on
directly. It lacks the grounding to reliably navigate, evaluate, and interpret material
from these sources, and its reliability in doing so is not guaranteed.

In each of these cases, the tool is operating without sufficient context to constrain its
behavior reliably. People whose circumstances are unusual or underrepresented are more
likely to fall outside those boundaries, and are therefore more likely to be affected.

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

The problems described in the previous section arise in different ways depending
on the kind of AI system involved. **Representation** problems affect any system
that learns from data, but are most acute for **task-specific supervised
systems**, where the training examples directly determine what the system can
and cannot handle well. **Performance problems**, including brittleness and
sycophancy, are most characteristic of **general-purpose generative systems**,
though outlier sensitivity affects task-specific systems as well. **Loss of
context** can occur across all system types, but takes different forms: for
task-specific systems it arises when the system is applied outside its training
domain, while for general-purpose generative systems it manifests as
hallucination and retrieval errors. **Opacity**, as discussed above, is a
condition that applies to all complex AI systems regardless of type.

Mitigations similarly vary by system type, and are organized here by strategy
rather than by problem, since a single strategy often addresses multiple
problems at once. Within each strategy, we note where guidance is specific to a
particular kind of AI system. The five strategies are: **Governance
strategies**, which address the foundational question of whether and how AI
should be used in a given decision-making context; **Data strategies**, which
concern how training and example data is collected and curated; **Architectural
strategies**, which concern how systems are designed and built; **Deployment
strategies**, which concern how systems are operated; and **Monitoring and
improvement**, which concern how systems are evaluated and corrected over time.
Throughout, the pervasive condition of opacity—our limited ability to understand
why complex AI systems behave as they do—constrains the confidence we can place
in any mitigation, and this should be borne in mind when reading each
subsection.

The guidance in this section is most fully developed for task-specific
supervised systems and general-purpose generative systems, as these are the
types for which risks and mitigations are best understood. Task-specific
unsupervised systems and general-purpose discriminative systems raise related
concerns, which are noted where relevant, but may warrant further elaboration as
understanding of these systems matures.

### Governance Strategies

The risk of statistical discrimination described in the previous section should
be weighed carefully in choosing *whether* AI tools should play any role in
making a given type of decision, and if so, *what* that role should be. There is
a moment during the development of an AI software project at which these risks
should be evaluated and strategic choices made about **whether the work should
proceed**, **with what objectives**, and **in what social context**. By this
stage, a research system or exploratory prototype may already exist;
alternatively, the project may only be a proposal. In either case, an evaluation
of the risks is warranted, taking into account the available mitigations.

The risk of statistical discrimination should be balanced against the risks
associated with alternative, non-automated means of achieving the same purpose.
Since human decision-makers may themselves be biased against atypical cases, a
fully manual procedure also carries a risk of discrimination. Training programs,
diversity awareness initiatives, and procedural fairness requirements can reduce
but not eliminate this risk. There are thus difficult choices to be made about
whether automation would improve the fairness of decision-making compared with
manual approaches, particularly for members of marginalized groups.

In some situations a proposed AI system may be **intended as a new access path**
to existing information or services rather than as a replacement for human
decision-making. Such a system might fail more often for less common user
requests.  This behavior could itself be discriminatory. A comparison is
therefore needed between the access users would actually get, with and without
the AI system, including especially for marginalized users.

If AI systems are to be used, attention should be given to building an
appropriate social context: ensuring that those who operate or oversee the tool
are equipped to understand its limitations and to implement monitoring and
mitigation techniques. This requires a degree of **transparency on the part of
the system**, about how it works, where it is likely to fail, and what it cannot
reliably do. Such transparency is a necessary condition for meaningful human
oversight; without it, those responsible for operating or reviewing the system
cannot exercise that responsibility effectively.

Meaningful risk evaluation at the governance stage depends on understanding how
a system works, where it is likely to fail, and for whom. This is constrained by
opacity, which varies significantly depending on how the system was obtained.
For systems developed in-house, developers have direct access to training data,
model architecture, and evaluation results, and transparency is largely within
their control. For procured systems, including most general-purpose generative
systems, the information needed to assess risk may be partially or wholly
unavailable to the deploying organization. This creates an important distinction
between developers, who control the system's fundamental properties, and
deployers, who are responsible for its use in a specific context but may have
limited visibility into how it works. Both bear responsibility for the outcomes
of deployment, but the mitigations available to each differ substantially, and
the degree of caution applied at the governance stage should reflect this.

### Data Strategies

The most fundamental mitigation for representation problems is to use large,
inclusive training data that reflects the diversity of people and circumstances
the system will encounter in deployment. This is straightforward in principle
but demanding in practice. People vary in many consequential ways, and these
differences commonly interact: knowing about people with attribute A, and people
with attribute B, is not enough to know about people who have both. Adequate
coverage of intersectional cases requires substantially more data than coverage
of single attributes considered independently, and full coverage may not be
achievable. Where it is not, the appropriate response is not to treat the system
as adequate for all cases, but to document the limits of coverage explicitly and
to flag cases that fall outside them, an approach we return to under
**Architectural Strategies** and **Monitoring and Improvement**.

For task-specific unsupervised systems, representational gaps take a distinctive
form. Rather than producing incorrectly labeled outputs, an underrepresented group
may be rendered invisible: too small or too diffuse to form a meaningful cluster
of its own, it may be absorbed into a dominant group it does not actually
resemble, or fragmented across multiple clusters in ways that obscure rather
than reflect its characteristics. The same principle of inclusive data
collection applies, but evaluation is harder since there is no ground truth
label against which to measure whether the system has grouped people
appropriately.

The points at which data choices matter differ by system type. For task-specific
supervised systems, the training data is the primary lever and is largely within
the control of developers. For general-purpose systems, deployers typically have
no influence over training data; as noted in the Governance section, this is a
developer responsibility. However, deployers of all system types retain
meaningful control over other data inputs, and these should be managed with the
same care as training data:

- _Fine-tuning data_. Where a general-purpose system is adapted for a specific
use case through fine-tuning, the fine-tuning data should itself be
representative of the population the system will serve, including marginalized
groups. A system that performs well on average in its general form may perform
poorly for specific groups if the fine-tuning data does not reflect their
circumstances.
- _In-context examples_. For systems shaped through in-context learning, the
examples included in prompts act as a form of training data and are subject to
the same representational risks. Care should be taken to ensure that in-context
examples do not systematically exclude or misrepresent the groups the system
will encounter.
- _Retrieval corpora_. For systems that consult external data sources, the
content of those sources is a form of data that shapes system behavior.
Retrieval corpora should be evaluated for coverage and potential
misrepresentation, and updated regularly to remain current.

For general-purpose discriminative systems, including embedding models used for
search or classification, the quality of the representations the system produces
depends on the breadth and balance of the data on which it was trained. A model
trained on data that underrepresents certain groups or contexts will produce
lower-quality representations for inputs from those groups, with downstream
effects on any task the model is used for. Deployers using procured embedding
models should seek information from developers about training data coverage, and
should evaluate model performance specifically for the groups and contexts
relevant to their use case.

In all cases, misrepresentation is as important a concern as
underrepresentation. Training or shaping data may include members of a group in
proportions or contexts that distort rather than reflect reality, for instance
historical data that encodes past patterns of discrimination. Data curation
should therefore attend not only to whether groups are present in the data, but
to how they are represented.

Data strategies can reduce representational gaps, but opacity limits our ability
to verify that they have done so. Even with inclusive training data, it is
difficult to confirm that a complex model has learned to handle underrepresented
groups appropriately, since the relationship between training data composition
and model behavior is not transparent. Evaluation on held-out data from
underrepresented groups provides evidence, but not certainty. Deployers should
therefore treat data strategies as a necessary but not sufficient condition for
fair treatment of marginalized groups.

### Architectural Strategies

Architectural strategies are design decisions made about how a system is built,
and they represent one of the most direct levers for reducing the risks
described in the previous section. Some of these strategies are available to
developers and deployers alike; others, particularly those that require access
to model internals, are primarily within the developer's control. As noted in
the Governance section, deployers of procured systems should seek transparency
from developers about what architectural mitigations have been implemented, and
should document clearly what additional mitigations they have put in place.

**Out-of-distribution detection**. For task-specific supervised systems, a
useful architectural mitigation is to add a processing step that assesses how
similar each new case is to the examples on which the system was trained. Cases
that differ substantially from those examples are out-of-distribution, and the
system's behavior on such cases is less reliable. Detecting these cases before
the system responds allows them to be routed for special handling, for example
to a human reviewer, rather than processed as though they were well within the
system's competence. A range of methods exists for this kind of assessment, and
the appropriate choice will depend on the nature of the data and the system. The
key requirement is that the method be validated on the specific data the system
will encounter in deployment, not just on benchmark datasets.

This mitigation connects directly to the data strategies discussed above:
documenting the limits of training data coverage is a prerequisite for
identifying which cases are likely to be out-of-distribution. Together, these
two strategies form the basis for a principled approach to handling unusual
cases.

**Guardrails** are facilities that examine the input to, or output from, a
system, and intervene to modify or constrain the system's response. They apply
across all system types, though their implementation differs. A guardrail might
inform a user that the system cannot reliably answer a particular kind of
question; it might flag inputs for which the system's response is likely to be
unreliable; or it might route inputs to alternative processing rather than
blocking them outright. Guardrails can also be used to detect and flag
out-of-distribution cases, complementing the detection strategy described above.

For general-purpose generative systems, guardrails are particularly important
because the space of possible inputs is essentially unbounded. A guardrail
cannot anticipate every failure mode, but it can be designed to catch known
categories of problematic input or output. Deployers have meaningful control
over guardrails even when they have limited access to model internals, and
implementing them is therefore a deployer responsibility as much as a developer
one. Where guardrails are built into a procured system by its developer,
deployers should seek to understand what they cover and where their limits lie.

**Retrieval constraints**. For generative systems that consult external data
sources, architectural choices about how retrieval is implemented can reduce
both hallucination and loss-of-context problems. Where it is feasible to limit
the system to responses that are grounded in retrieved content rather than
generated freely, the risk of fabrication is reduced. A stronger version of this
approach implements retrieval as a data flow in which responses come directly
from a trusted source once identified by the system, rather than being generated
by the system itself. This does not eliminate retrieval errors, but it removes
the system's ability to fabricate content that has no basis in the source
material.

**Sycophancy**, where a system adjusts its responses to match what a user
appears to want rather than what is accurate, is addressed primarily through
alignment techniques applied by developers during training, and is largely
outside the control of deployers. Fine-tuning on carefully curated examples may
help, but it is difficult to verify that such adjustments reliably reduce
sycophancy without affecting other aspects of system behavior. Deployers have
limited architectural levers here; prompt design offers some mitigation, and is
discussed under Deployment Strategies.

**Model selection and replaceability.** The problems described in the previous section,
particularly fabrication and loss of context, vary significantly across models, and newer
models often improve on known failure modes. Developers should track failure rates for
the specific tasks their system performs and evaluate whether alternative or more recent
models reduce those rates. To make this practical, systems should be designed so that the
underlying model can be replaced without requiring a major redesign. This means avoiding
tight coupling to a single vendor's API or capabilities, both in code and in contractual
arrangements. Model selection is not a one-time decision but an ongoing one, and the
architecture should support that.

**Opacity** limits confidence in all of the architectural mitigations described
here. Out-of-distribution detection can flag unusual cases, but cannot fully
characterize why a system is likely to fail on them. Guardrails can catch known
failure modes, but cannot anticipate failure modes that are not yet understood.
Retrieval constraints reduce but do not eliminate fabrication, and it is
difficult to verify that a system is consistently respecting those constraints
in practice. Implementers should treat architectural mitigations as
risk-reducing rather than risk-eliminating measures.

### Deployment Strategies

Deployment strategies concern how AI systems are operated once in production.
Unlike the strategies discussed in previous sections, they are almost entirely
within the control of deployers, and apply regardless of whether the system was
developed in-house or procured.

**Human oversight.** In view of the uncertainties surrounding AI systems,
deployers should provide meaningful human oversight over their operation. This
is particularly important for unusual cases, which, as discussed in the previous
sections, are the most likely to be mishandled. Where out-of-distribution
detection has been implemented as an architectural measure, the routing of
flagged cases to human reviewers is the corresponding deployment practice. Where
it has not, deployers should establish alternative criteria for identifying
cases that warrant human review.

A practical difficulty arises when a system performs well in the majority of
cases: sustained attention to oversight tends to diminish when errors are rare.
One approach to maintaining vigilance is to periodically inject synthetic cases
for which the correct response is known and a specific kind of error is likely,
without the reviewer being aware that the case is synthetic. This allows
deployers to monitor whether human oversight is being exercised effectively, and
to intervene when attention lapses.

Human oversight is only effective if carried out by people with the knowledge
needed to evaluate whether a response is appropriate, including for unusual
cases. Assigning oversight responsibilities to people who lack this knowledge
provides a false sense of assurance without the substance.

**User feedback and appeals.** The people with the greatest stake in the correct
operation of a system are often those whose cases it handles. Deployers should
therefore put in place accessible mechanisms through which users can indicate
when they believe a system has not handled their case correctly. Where legal
rights or significant interests are at stake, effective appeal and review
procedures should be established to ensure adequate human supervision of
contested decisions.

Feedback mechanisms should also include access to human assistance, providing a
route past the automated system for users whose situations it has not handled
well. This is both a fairness measure and a practical one: users who cannot
obtain appropriate assistance through an automated system will not simply accept
an inadequate response, and the costs of unresolved failures can be substantial.

**Prompt design.** For general-purpose generative systems, the design of prompts
is a meaningful deployment lever that can mitigate several of the problems
described in the previous section. Explicitly providing context about the user's
situation in the prompt can reduce loss-of-context failures, since the system is
less likely to respond inappropriately when relevant circumstances are made
explicit rather than assumed. Deliberately varying the framing of a query and
comparing responses across framings can help detect brittleness: if
substantively identical queries produce substantially different responses, the
system's reliability for that kind of query is in question. For sycophancy,
explicit prompt instructions asking the system not to tailor its response to
perceived user preferences offer some mitigation, though the reliability of this
approach is difficult to verify and should not be treated as a complete
solution.

Prompt design is a deployer responsibility, but its effectiveness is constrained
by properties of the underlying model that deployers do not control. Deployers
should therefore treat prompt design as a complement to, rather than a
substitute for, the architectural and data strategies discussed in previous
sections.

Opacity creates a particular challenge for human oversight in deployment.
Reviewers examining the output of a complex AI system cannot in general
understand why the system produced a given response, which limits their ability
to assess whether it is reliable or to anticipate how the system might fail on
similar cases in the future. Feedback mechanisms and appeals processes can
identify that something has gone wrong, but typically cannot explain why.
Deployers should be explicit with human reviewers about this limitation, and
should design oversight processes that do not assume reviewers can fully
evaluate the reasoning behind system outputs.

### Monitoring and Improvement Strategies

**Testing** is an essential mitigation, but its scope and reliability differ
substantially from testing of conventional software. For conventional software,
the space of valid inputs is specified in advance, and for each input there is a
correct output; testing can therefore be systematic and its coverage measurable.

For task-specific supervised systems, something approaching this situation may
hold in simple cases, where inputs are constrained to a specified format. Even
here, however, it may not always be clear what the correct response is for an
input that instantiates an unusual combination of attributes. Testing should
explore how the system behaves across the range of cases it will encounter in
deployment, with particular attention to cases involving groups that are
underrepresented in training data.

For general-purpose generative systems the situation is considerably harder. The
flexibility that makes these systems useful, such as unconstrained inputs, and
outputs that need not take any particular form, also makes systematic testing
difficult. Testing can increase confidence that a system works adequately, but
it cannot provide the certainty that conventional software testing often
achieves. In practice, automated testing of generative systems typically relies
on other generative systems to evaluate outputs, which introduces its own
uncertainties.

In both cases, testing should specifically target unusual and edge cases, since
these are the most likely to be mishandled and the least likely to be caught by
tests designed around typical inputs.

Opacity compounds the limitations of testing for AI systems. Even when a system
passes a carefully designed test suite, it is not possible to fully understand
why it behaves as it does, or to be confident that good performance on tested
cases reflects reliable behavior on untested ones. This is particularly
consequential for unusual cases involving marginalized groups, where test
coverage is hardest to achieve and the consequences of failure are greatest.

**Continuous improvement.** When a system produces incorrect or inadequate
responses, deployers should have processes in place to act on this. The
appropriate mechanism depends on the system type.

For task-specific supervised systems, the primary approach is retraining:
incorporating corrected cases into the training data and retraining the model,
or using targeted techniques such as active learning to prioritize the labeling
of cases in regions of the input space where the system performs poorly. Any
retraining should be followed by testing to verify that performance has improved
for the targeted cases without degrading for others.

For general-purpose generative systems, retraining is typically not available to
deployers. Two practical alternatives exist. First, where a system has retrieval
capabilities, a database of past cases and their correct handling can be made
available to the system, allowing it to consult prior experience when handling
similar new cases. Second, corrected cases with their appropriate responses can
be added to prompts, drawing on the capacity of modern generative systems to
learn from in-context examples. Both approaches require monitoring to verify
that they have the intended effect, since neither guarantees that the system
will generalize correctly from the added material.

Across all system types, improvement processes should themselves be subject to
oversight. Corrections that appear to work in testing may not generalize
reliably to new cases, and changes intended to improve performance in one area
may have unintended effects elsewhere. The opacity of complex AI systems means
that improvement can rarely be verified with certainty; it can only be made more
or less probable through careful testing and monitoring.

## Conclusion

AI systems offer genuine potential for improving the quality and consistency of
decisions and services, within the resource constraints that implementers,
developers, and deployers invariably face. But that potential comes with risks
that this specification has sought to make concrete: systems that perform well
on average may perform poorly for people whose circumstances are unusual, and
those people are often the ones who most need reliable and fair treatment.

The mitigations described in this specification do not eliminate these risks.
Data strategies can reduce but not close representational gaps. Architectural
and deployment strategies can catch and route unusual cases, but depend on
opacity being at least partially offset by transparency. Monitoring and
improvement can correct known failures, but cannot guarantee that corrections
generalize. Governance can frame the decision about whether and how to deploy AI
thoughtfully, but cannot substitute for ongoing vigilance once systems are in
operation.

What this specification does offer is a structured basis for that vigilance: a
way of asking, at each stage of development and deployment, whether the risks to
people at the margins have been taken seriously and whether the available
mitigations have been applied. That is not a guarantee of fairness, but it is a
necessary condition for it.




