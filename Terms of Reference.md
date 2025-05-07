# Terms of Reference

## Table of Contents

- [Overview](#overview)
- [Project Scope](#project-scope)
- [Purpose of the Technical Committee](#purpose-of-the-technical-committee)
- [Membership Composition](#membership-composition)
- [Project Schedule](#project-schedule)
- [Meeting Schedule](#meeting-schedule)
- [Consensus Building](#consensus-building)
- [Communication and Conduct](#communication-and-conduct)
- [Contributor Licence](#contributor-licence)
- [Licence](#licence)
- [Glossary](#glossary)

## Overview

This Terms of Reference (ToR) defines the goals of the Trust Meter Technical
Specification, how it differs or relates to other specifications regarding
Artificial Intelligence (AI) and Trust, and the objectives of the Technical
Committee, outlining the roles and responsibilities of those involved.

## Project Scope

The Trust Meter Technical Specification addresses statistical discrimination
against data outliers and small minorities in mechanized statistical reasoning
in AI decision tools. The Trust Meter Technical Specification is intended to
alert AI operators when the scenario, group or individual about whom the
decision is made is out-of-distribution relative to the training set the model
is trained on, meaning the AI should not be trusted to make decisions in this
context.

## Purpose of the Technical Committee

The specification applies to machine learning (ML) based decision tools. Hence,
the focus of the technical committee is limited to the subset of AI that
uses machine learning with large data sets for training and statistical
algorithms to develop a model that is used for decision making.

The overall objective of the Technical Committee is to specify how to evaluate a
machine learning model's decision making when used with marginalized or outlier
individuals; and to detect whether the use of the AI discriminates against them.
This main objective leads to some sub-goals.

The committee will develop definitions of "marginalized" and "outlier" to fully
contextualize their importance and relevance to the evaluation of an AI model.
This will help operationalize the notion of statistical discrimination. 
Considerations in this regard include the reasons why an individual is deemed
marginalized or an outlier.  A possible reason, or example, is that they were
either not part of the training data or were poorly represented within it.
Another reason might be the nature of the model or algorithm(s) that the AI uses
in making its decisions.  That model or algorithm might produce discriminatory
results in the context of a marginalized individual and that would indicate it
is inappropriate to use in this particular case.

The committee will also delineate the kinds of ML-AI that are relevant to the
specification.  For example, an AI that is definitely out-of-scope is one that
generates photorealistic images of human faces. This kind of AI is not properly
described as making any decisions. However, a large language model (LLM) may or
may be in scope. For example, consider this scenario: An AI decision tool is
known to discriminate and it uses an LLM during its processing to arrive at a
decision.  The LLM might be the source of the discrimination; hence, the LLM is
in scope in this scenario.

The committee will develop and document techniques for evaluating an ML-AI in
order to determine whether it discriminates or can potentially discriminate.
This might involve the methods used in the field of explainable AI. The
techniques that are developed by the technical committee will allow an operator
to judge whether an AI can be trusted when used in a specific context.

The above are the main objectives of the committee.  The committee, in its work,
may discover other related and relevant objectives, and can include and develop
them as part of the specification.

The committee shall publish a number of drafts of the specification and solicit
comments and feedback for review. It will address these questions and comments
and generally facilitate the review process.  In this regard, the committee
shall provide guidance on whether a full public review or a peer review or both
is required. After the review(s) are completed the technical committee shall
finalize the specification and vote on its publication at large.

Administrative issues that the technical committee will handle include:

- [Meeting Schedule](#meeting-schedule)
  - The technical committee shall decide among themselves when and how they will
    conduct their meetings.
- [Meeting Methodology and Collaborative Processes](#meeting-methodology-and-collaborative-processes)
  - The committee members shall decide what tools and processes they will use
    to communicate with one another and to produce drafts of the specification.
- [Roles and Responsibilities](#role-and-responsibilities)
  - The committee members shall discuss and decide their roles and
    responsibilities.

- Includes Technical Experts who will draft the Technical Specification
  - Consider gender responsiveness when drafting the Technical Specification
  - Consider environmental responsiveness when drafting the Technical 
    Specification

## Membership Composition

Since the specification is being developed for the Standards Council of Canada,
a committee member shall work in either English or French, the two official
languages of Canada.

If a committee member has special needs, they shall be accommodated.  For
example, if a committee member uses ASL or LSQ as their means of communication,
then a translation service shall be provided so that all members on the
committee can communicate with one another meaningfully.

- Other requirements?

### Roles and Responsibilities

The committee members shall discuss and determine their roles during their
earliest meetings. Examples of roles include, but are not limited to, chair,
note-taker, specification editor(s), and so on. The need to create new roles or
change roles as time demands shall be decided by the committee as necessary.

## Project Schedule

### Key dates

- Technical Specification drafting completed by **January 19, 2026**
- Review of Technical Specification completed by **April 30, 2026**
- Project end date **May 31, 2026**

### Stages

Stages may complete before the due date, but must not exceed it. Work on
subsequent stages in some cases may start prior to the completion of previous
stages.

1. Stage 1: Preliminary - Circumstances for Use of TS (due April 14, 2025)
2. Stage 2: Initiation - New Work Item Proposal (due May 5, 2025)
3. Stage 3: Notice (due May 5, 2025)
4. Stage 4: Committee (due September 12, 2025)
5. Stage 5: Drafting (due January 19, 2026)
6. Stage 6: Approval (due April 30, 2026)
7. Stage 7: Publication (due May 28, 2026)
8. Stage 8: Maintenance (due May 28, 2026)

## Meeting Schedule

In general work will be conducted asynchronously; however, the Technical
Committee is expected to meet synchronously monthly.

Additional meetings between Technical Experts, the Technical Committee, and
other stakeholders may have meetings at other times as needed.

### Meeting Methodology and Collaborative Processes

The means and tools used by the committee for meetings and drafting the
specifications, including tracking versions of it and changes to it, shall be
decided by the committee members during their earliest meetings.

## Consensus Building

## Communication and Conduct

See: [Code of Conduct](CODE_OF_CONDUCT.md)

## Contributor Licence

- possibly use the one from [fluid](https://fluidproject.atlassian.net/wiki/spaces/fluid/pages/11547472/Fluid+Licensing)
- [Contributor Licence](./CONTRIBUTOR_LICENCE.md) derived from [ASC](https://accessible.canada.ca/creating-accessibility-standards/asc-62-accessible-equitable-artificial-intelligence-systems/2-asc-legal-notice),
  specifically section 2.5 but re-worded for use with the IDRC.

## Licence

See [LICENCE.md](LICENCE.md)

## Glossary

- **Technical Specification (TS):** A document which has been developed without
using the full consensus process that normally be associated with a National
Standard of Canada (NSC). This may be for cases such as an environment
undergoing rapid change. A Technical Specification is not a standard and does
not purport to be one. However, an NSC may be developed in the future to
supersede the Technical Specification.
