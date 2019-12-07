package com.cf.project.mybatis.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CShjlExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public CShjlExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andDeviceidsIsNull() {
            addCriterion("deviceIds is null");
            return (Criteria) this;
        }

        public Criteria andDeviceidsIsNotNull() {
            addCriterion("deviceIds is not null");
            return (Criteria) this;
        }

        public Criteria andDeviceidsEqualTo(String value) {
            addCriterion("deviceIds =", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsNotEqualTo(String value) {
            addCriterion("deviceIds <>", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsGreaterThan(String value) {
            addCriterion("deviceIds >", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsGreaterThanOrEqualTo(String value) {
            addCriterion("deviceIds >=", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsLessThan(String value) {
            addCriterion("deviceIds <", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsLessThanOrEqualTo(String value) {
            addCriterion("deviceIds <=", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsLike(String value) {
            addCriterion("deviceIds like", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsNotLike(String value) {
            addCriterion("deviceIds not like", value, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsIn(List<String> values) {
            addCriterion("deviceIds in", values, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsNotIn(List<String> values) {
            addCriterion("deviceIds not in", values, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsBetween(String value1, String value2) {
            addCriterion("deviceIds between", value1, value2, "deviceids");
            return (Criteria) this;
        }

        public Criteria andDeviceidsNotBetween(String value1, String value2) {
            addCriterion("deviceIds not between", value1, value2, "deviceids");
            return (Criteria) this;
        }

        public Criteria andCreaterIsNull() {
            addCriterion("creater is null");
            return (Criteria) this;
        }

        public Criteria andCreaterIsNotNull() {
            addCriterion("creater is not null");
            return (Criteria) this;
        }

        public Criteria andCreaterEqualTo(String value) {
            addCriterion("creater =", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterNotEqualTo(String value) {
            addCriterion("creater <>", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterGreaterThan(String value) {
            addCriterion("creater >", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterGreaterThanOrEqualTo(String value) {
            addCriterion("creater >=", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterLessThan(String value) {
            addCriterion("creater <", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterLessThanOrEqualTo(String value) {
            addCriterion("creater <=", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterLike(String value) {
            addCriterion("creater like", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterNotLike(String value) {
            addCriterion("creater not like", value, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterIn(List<String> values) {
            addCriterion("creater in", values, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterNotIn(List<String> values) {
            addCriterion("creater not in", values, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterBetween(String value1, String value2) {
            addCriterion("creater between", value1, value2, "creater");
            return (Criteria) this;
        }

        public Criteria andCreaterNotBetween(String value1, String value2) {
            addCriterion("creater not between", value1, value2, "creater");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createTime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createTime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("createTime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createTime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createTime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createTime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createTime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createTime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createTime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createTime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("createTime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createTime not between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCheckerIsNull() {
            addCriterion("checker is null");
            return (Criteria) this;
        }

        public Criteria andCheckerIsNotNull() {
            addCriterion("checker is not null");
            return (Criteria) this;
        }

        public Criteria andCheckerEqualTo(String value) {
            addCriterion("checker =", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerNotEqualTo(String value) {
            addCriterion("checker <>", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerGreaterThan(String value) {
            addCriterion("checker >", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerGreaterThanOrEqualTo(String value) {
            addCriterion("checker >=", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerLessThan(String value) {
            addCriterion("checker <", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerLessThanOrEqualTo(String value) {
            addCriterion("checker <=", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerLike(String value) {
            addCriterion("checker like", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerNotLike(String value) {
            addCriterion("checker not like", value, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerIn(List<String> values) {
            addCriterion("checker in", values, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerNotIn(List<String> values) {
            addCriterion("checker not in", values, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerBetween(String value1, String value2) {
            addCriterion("checker between", value1, value2, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckerNotBetween(String value1, String value2) {
            addCriterion("checker not between", value1, value2, "checker");
            return (Criteria) this;
        }

        public Criteria andCheckdateIsNull() {
            addCriterion("checkdate is null");
            return (Criteria) this;
        }

        public Criteria andCheckdateIsNotNull() {
            addCriterion("checkdate is not null");
            return (Criteria) this;
        }

        public Criteria andCheckdateEqualTo(Date value) {
            addCriterion("checkdate =", value, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateNotEqualTo(Date value) {
            addCriterion("checkdate <>", value, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateGreaterThan(Date value) {
            addCriterion("checkdate >", value, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateGreaterThanOrEqualTo(Date value) {
            addCriterion("checkdate >=", value, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateLessThan(Date value) {
            addCriterion("checkdate <", value, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateLessThanOrEqualTo(Date value) {
            addCriterion("checkdate <=", value, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateIn(List<Date> values) {
            addCriterion("checkdate in", values, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateNotIn(List<Date> values) {
            addCriterion("checkdate not in", values, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateBetween(Date value1, Date value2) {
            addCriterion("checkdate between", value1, value2, "checkdate");
            return (Criteria) this;
        }

        public Criteria andCheckdateNotBetween(Date value1, Date value2) {
            addCriterion("checkdate not between", value1, value2, "checkdate");
            return (Criteria) this;
        }

        public Criteria andJiemuidIsNull() {
            addCriterion("jiemuId is null");
            return (Criteria) this;
        }

        public Criteria andJiemuidIsNotNull() {
            addCriterion("jiemuId is not null");
            return (Criteria) this;
        }

        public Criteria andJiemuidEqualTo(Integer value) {
            addCriterion("jiemuId =", value, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidNotEqualTo(Integer value) {
            addCriterion("jiemuId <>", value, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidGreaterThan(Integer value) {
            addCriterion("jiemuId >", value, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidGreaterThanOrEqualTo(Integer value) {
            addCriterion("jiemuId >=", value, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidLessThan(Integer value) {
            addCriterion("jiemuId <", value, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidLessThanOrEqualTo(Integer value) {
            addCriterion("jiemuId <=", value, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidIn(List<Integer> values) {
            addCriterion("jiemuId in", values, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidNotIn(List<Integer> values) {
            addCriterion("jiemuId not in", values, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidBetween(Integer value1, Integer value2) {
            addCriterion("jiemuId between", value1, value2, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andJiemuidNotBetween(Integer value1, Integer value2) {
            addCriterion("jiemuId not between", value1, value2, "jiemuid");
            return (Criteria) this;
        }

        public Criteria andDatesIsNull() {
            addCriterion("dates is null");
            return (Criteria) this;
        }

        public Criteria andDatesIsNotNull() {
            addCriterion("dates is not null");
            return (Criteria) this;
        }

        public Criteria andDatesEqualTo(Date value) {
            addCriterion("dates =", value, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesNotEqualTo(Date value) {
            addCriterion("dates <>", value, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesGreaterThan(Date value) {
            addCriterion("dates >", value, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesGreaterThanOrEqualTo(Date value) {
            addCriterion("dates >=", value, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesLessThan(Date value) {
            addCriterion("dates <", value, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesLessThanOrEqualTo(Date value) {
            addCriterion("dates <=", value, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesIn(List<Date> values) {
            addCriterion("dates in", values, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesNotIn(List<Date> values) {
            addCriterion("dates not in", values, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesBetween(Date value1, Date value2) {
            addCriterion("dates between", value1, value2, "dates");
            return (Criteria) this;
        }

        public Criteria andDatesNotBetween(Date value1, Date value2) {
            addCriterion("dates not between", value1, value2, "dates");
            return (Criteria) this;
        }

        public Criteria andTimesIsNull() {
            addCriterion("times is null");
            return (Criteria) this;
        }

        public Criteria andTimesIsNotNull() {
            addCriterion("times is not null");
            return (Criteria) this;
        }

        public Criteria andTimesEqualTo(Date value) {
            addCriterion("times =", value, "times");
            return (Criteria) this;
        }

        public Criteria andTimesNotEqualTo(Date value) {
            addCriterion("times <>", value, "times");
            return (Criteria) this;
        }

        public Criteria andTimesGreaterThan(Date value) {
            addCriterion("times >", value, "times");
            return (Criteria) this;
        }

        public Criteria andTimesGreaterThanOrEqualTo(Date value) {
            addCriterion("times >=", value, "times");
            return (Criteria) this;
        }

        public Criteria andTimesLessThan(Date value) {
            addCriterion("times <", value, "times");
            return (Criteria) this;
        }

        public Criteria andTimesLessThanOrEqualTo(Date value) {
            addCriterion("times <=", value, "times");
            return (Criteria) this;
        }

        public Criteria andTimesIn(List<Date> values) {
            addCriterion("times in", values, "times");
            return (Criteria) this;
        }

        public Criteria andTimesNotIn(List<Date> values) {
            addCriterion("times not in", values, "times");
            return (Criteria) this;
        }

        public Criteria andTimesBetween(Date value1, Date value2) {
            addCriterion("times between", value1, value2, "times");
            return (Criteria) this;
        }

        public Criteria andTimesNotBetween(Date value1, Date value2) {
            addCriterion("times not between", value1, value2, "times");
            return (Criteria) this;
        }

        public Criteria andIspassIsNull() {
            addCriterion("ispass is null");
            return (Criteria) this;
        }

        public Criteria andIspassIsNotNull() {
            addCriterion("ispass is not null");
            return (Criteria) this;
        }

        public Criteria andIspassEqualTo(String value) {
            addCriterion("ispass =", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassNotEqualTo(String value) {
            addCriterion("ispass <>", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassGreaterThan(String value) {
            addCriterion("ispass >", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassGreaterThanOrEqualTo(String value) {
            addCriterion("ispass >=", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassLessThan(String value) {
            addCriterion("ispass <", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassLessThanOrEqualTo(String value) {
            addCriterion("ispass <=", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassLike(String value) {
            addCriterion("ispass like", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassNotLike(String value) {
            addCriterion("ispass not like", value, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassIn(List<String> values) {
            addCriterion("ispass in", values, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassNotIn(List<String> values) {
            addCriterion("ispass not in", values, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassBetween(String value1, String value2) {
            addCriterion("ispass between", value1, value2, "ispass");
            return (Criteria) this;
        }

        public Criteria andIspassNotBetween(String value1, String value2) {
            addCriterion("ispass not between", value1, value2, "ispass");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table c_shjl
     *
     * @mbg.generated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table c_shjl
     *
     * @mbg.generated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}