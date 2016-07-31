var Students = React.createClass({

    getInitialState() {
        return {
            students: this.props.students,
            student: {
                name:'',
                class_mapping_id: null,
                standard:'',
                section: ''
            },
            filteredData: '',
            options: this.props.options
        }
    },

    search(e) {
        e.preventDefault();
        const regex = new RegExp(e.target.value, 'i');
        const filtered = this.props.students.filter(function(student) {
            return (student.name.search(regex) > -1)||(student.standard.search(regex) > -1)||(student.section.search(regex) > -1);
        });

        this.setState({
            students: filtered
            // students: studentList
        });

    },
    handleNameChange(e) {
        var newStudent = this.state.student;
        newStudent.name = e.target.value;
        this.setState({student: newStudent});
    },

    handleOptionChange(e) {
        var index = event.target.selectedIndex;
        selectedClass = event.target[index].text.split('-', 2);
        var newStudent =   this.state.student;
        newStudent.class_mapping_id = e.target.value;
        newStudent.standard = selectedClass[0];
        newStudent.section = selectedClass[1];
        this.setState({student: newStudent});
    },

    addNewStudent() {
        var that = this;
        $.ajax({
            method: 'POST',
            data: {
                student: that.state.student,
            },
            url: 'students/',
            success: function(res) {
                var newStudentList = that.state.students;
                newStudentList.push(res);
                that.setState({
                    students: newStudentList,
                    student: {
                        name:'',
                        class_mapping_id: null,
                        standard:'',
                        section: ''
                    }
                });
            }
        });
    },


    render: function() {
        students = this.state.students.map( function(student) {
            return (
                <Student student={student} key={student.id} onRemoveStudent="handleStudentRemove"/>
            );
        });
        return (
            <div>
                <h1>Listing Students</h1>
                <div id="students">
                    <input
                        type="text"
                        onChange={ this.search }
                        placeholder="Search" />
                    <table>
                        <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Standard</th>
                            <th>Section</th>
                        </tr>
                        </thead>
                        <tbody>
                        {students}
                        </tbody>
                    </table>
                    <input type="text" placeholder="Enter new student name" onChange={this.handleNameChange} /><br />
                    <select className="browser-default" onChange={this.handleOptionChange}>
                        <option value="">Select</option>
                        {
                            this.props.options.map(function(option) {
                                return <option key={option.value}
                                               value={option.value}>{option.label}</option>;
                            })
                        }
                    </select>
                    <button class="waves-effect waves-light btn" onClick={this.addNewStudent}>New Student</button>
                </div>
            </div>
        );
    },

    handleStudentRemove(student) {
        var studentList = this.state.students.filter(function(item) {
            return student.id !== item.id;
        });
        this.setState({
            students: studentList
        });
    }
    
});

