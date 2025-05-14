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

- Deciding on an appropriate open document licence for the technical
  specification.
  - The licence must meet the requirements listed in the [Licence](#licence)
    section.
- [Meeting Schedule](#meeting-schedule)
  - The technical committee shall decide among themselves when and how they will
    conduct their meetings.
- [Meeting Methodology and Collaborative Processes](#meeting-methodology-and-collaborative-processes)
  - The committee members shall decide what tools and processes they will use
    to communicate with one another and to produce drafts of the specification.
- [Roles and Responsibilities](#role-and-responsibilities)
  - The committee members shall discuss and decide their roles and
    responsibilities.

## Membership Composition

The technical committee will include members who are experts in the field of
statistical reasoning, statistical data processing, machine learning, and AI.

Since the specification is being developed for the Standards Council of Canada,
a committee member shall work in either English or French, the two official
languages of Canada.

### Equitable Participation Support

The needs of committee members to participate equitably will be supported. This
includes, but is not limited to, providing French/English translation services,
American Sign Language (ASL) interpretation, and Langue des Signes Québécoise
(LSQ) interpretation.

Efforts shall be made to address SCC's [Gender responsivness](https://scc-ccn.ca/areas-work/diversity-and-inclusion/gender-and-standardization)
goals when developing the technical specification, and consider the [UNECE Guidelines on Developing Gender-Responsive Standards](https://unece.org/sites/default/files/2022-12/ECE_TRADE_472E.pdf).
With respect to membership within the technical committee, efforts will be made
such that all genders are represented.

### Roles and Responsibilities

The committee members shall discuss and determine their roles during their
earliest meetings. Examples of roles include, but are not limited to, meeting
convenor, chair, note-taker, specification editor(s), and so on. The need to
create new roles or change roles as time demands shall be decided by the
committee as necessary.

#### Expectations for Committee Members:

1. Active Participation:
  - Engagement: Actively participate in discussions and meetings, sharing your
    perspectives and expertise.
  - Preparation: Come prepared to meetings by reviewing relevant materials and
    information in advance.
2. Collaboration:
  - Open Dialogue: Engage in open and respectful dialogue, listening to and
    considering the viewpoints of others.
  - Constructive Feedback: Provide constructive feedback and suggestions to
    help refine ideas and proposals.

#### Role of the Meeting Convenor:

- Facilitation: The meeting convenor will facilitate discussions, ensuring that
  all voices are heard and that the process remains inclusive and respectful.
- Time Management: The convenor will manage the time allocated for discussions
  to ensure efficient and productive meetings.
- Conflict Resolution: The convenor will assist in mediating conflicts and
  guiding the committee towards consensus.

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

<dl>
<dt>Objective:</dt>
<dd>
  To ensure that decisions made by the committee reflect the collective
  agreement and support of its members, fostering a collaborative and inclusive
  environment.
</dd>
</dl>

### Principles:

<dl>
<dt>Inclusivity:</dt>
<dd>
  All committee members should have the opportunity to voice their opinions and
  contribute to discussions.
</dd>
<dt>Transparency:</dt>
<dd>
  The process of reaching consensus should be clear and open to all members.
</dd>
<dt>Respect:</dt>
<dd>
  Members should respect differing viewpoints and work towards finding common
  ground.
</dd>
</dl>

### Process:

1. Consensus Seeking:
  - Facilitation: The meeting convenor will guide discussions and ensure
    balanced participation.
  - Clarification: Members will address any questions or concerns to ensure
    understanding and agreement.
  - Support: Members will work collaboratively to find common ground and support
    the collective decision-making process.

2. Decision Making:
  - Unanimous Agreement: Aim for unanimous agreement where possible.
  - Voting: Where a vote is required, a motion will pass if it receives a
    minimum of two-thirds (2/3) of the votes cast by the committee members
    present.
  - Documentation: Ensure that decisions and the process followed to reach them
    are accurately recorded.

### Conflict Resolution:

- Mediation: In cases where consensus cannot be reached, a mediation process
  will be initiated. A neutral mediator from IDRC will work with the involved
  parties to resolve conflicts and find a mutually acceptable solution.
- Escalation: If mediation does not resolve the conflict, the issue will be
  escalated to a higher authority within OCAD University or the Standards
  Council of Canada for a final decision.

## Communication and Conduct

Conduct of participants in this specification effort is governed by [SCC's Member Code of Conduct](https://scc-ccn.ca/system/files/2024-05/scc_pol_member-code-of-conduct_v1_2023-12-19.pdf).

## Contributor Licence

During review of drafts of the technical specification, the committee may
solicit input from individuals not on the committee. Any comments or critique
offered for consideration shall be provided under the terms of the [Contributor Licence](./CONTRIBUTOR_LICENCE.md).

## Licence

The licensing requirements are that a free/open document licence is used that:

1. Attributes the original work to the IDRC, OCAD University,
2. Allows any software associated with the technical specification to be
   licensed by a separate free/open software licence, 
3. Permits others to make modifications to the specification provided they
   attribute the original work to the IDRC, and that they release their
   modifications under same licensing terms as the original.

Examples of licences that meet these terms are the [Creative Commons Attribution-ShareAlike licence](https://creativecommons.org/licenses/by-sa/4.0/)
(CC BY-AT 4.0) and the [GNU Free Document Licence](https://www.GNU.org/licenses/fdl-1.3.en.html) (GNU FDL).

The committee shall decide upon a suitable licence given the above criteria.

## Glossary

- **Technical Specification (TS):** A document which has been developed without
using the full consensus process that normally be associated with a National
Standard of Canada (NSC). This may be for cases such as an environment
undergoing rapid change. A Technical Specification is not a standard and does
not purport to be one. However, an NSC may be developed in the future to
supersede the Technical Specification.
