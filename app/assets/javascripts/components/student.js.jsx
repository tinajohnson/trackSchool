var Student = React.createClass({
    getInitialState() {
        return {
            student: this.props.student,
            options: this.props.options
        }
    },

    setEditMode() {
        this.setState({editMode: true});
    },

    render() {
        if ( this.state.editMode ) {
            return (
                <tr>
                    <td><input
                        type="text"
                        value={this.state.student.name}
                        onChange={this.handleNameChange} />
                    </td>
                    <td>
                        <select className="browser-default" onChange={this.handleOptionChange}>
                            <option value="">Select</option>
                            {
                                this.props.options.map(function(option) {
                                    return <option key={option.value}
                                                   value={option.value}>{option.label}</option>;
                                })
                            }
                        </select>
                    </td>
                    <td>
                        <button onClick={this.handleStudentUpdate}>Save</button>
                    </td>
                </tr>
            );
        } else {
            return (
                <tr>
                    <td>{this.state.student.name}</td>
                    <td>{this.state.student.standard}</td>
                    <td>{this.state.student.section}</td>
                    <td>
                        <button onClick={this.setEditMode}>Edit</button>
                    </td>
                    <td>
                        <button onClick={this.removeStudent}>Destroy</button>
                    </td>
                </tr>
            );
        }
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

    handleStudentUpdate() {
        var that = this;
        $.ajax({
            method: 'PUT',
            data: {
                student: that.state.student,
            },
            url: '/students/' + that.state.student.id,
            success: function(res) {
                that.setState({
                    student: res,
                    editMode: false
                });
            }
        });
    },

    removeStudent() {
        var that = this;
        $.ajax({
            method: 'DELETE',
            url: '/students/'+that.state.student.id,
            success: function(res) {
                that.props.onRemoveStudent(that.state.student);
            }
        })
    }
});